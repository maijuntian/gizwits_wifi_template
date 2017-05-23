package ${packageName}.activity;

import android.annotation.SuppressLint;
import android.app.backup.SharedPreferencesBackupHelper;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;

import com.gizwits.gizwifisdk.api.GizDeviceSharing;
import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.bean.DeviceStatus;
import ${packageName}.bean.User;
import ${packageName}.delegate.MainDelegate;
import ${packageName}.service.UserService;
import ${packageName}.utils.CmdUtils;
import ${packageName}.utils.CommonUtils;
import ${packageName}.utils.DialogUtils;
import ${packageName}.utils.Keys;
import ${packageName}.utils.NetUtils;
import com.mai.xmai_fast_lib.utils.MLog;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;
import com.mai.xmai_fast_lib.utils.XAppManager;

import org.json.JSONException;
import org.json.JSONObject;
import org.xwalk.core.XWalkNavigationHistory;
import org.xwalk.core.XWalkResourceClient;
import org.xwalk.core.XWalkSettings;
import org.xwalk.core.XWalkView;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import butterknife.OnClick;
import rx.Observable;
import rx.functions.Action1;

public class MainActivity extends BaseActivity<MainDelegate> {

    boolean hasPressBack = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        initWebView();
    }

    @Override
    public boolean isStatusBarTranslucent() {
        return false;
    }

    @OnClick(R.id.tv_device_list)
    public void switchDevice() {
        viewDelegate.switchDeviceList();
    }

    @OnClick(R.id.tv_device_manager)
    public void deviceManager() {
        startActivity(DeviceManagerActivity.class, false);
    }

    @OnClick(R.id.tv_user_info)
    public void userInfo() {
        startActivity(UserInfoActivity.class, false);
    }

    @OnClick(R.id.tv_about)
    public void about() {
        startActivity(AboutUsActivity.class, false);
    }

    @OnClick(R.id.rl_refresh)
    public void refresh() {
        User currUser = MyApplication.getInstance().getCurrUser();
        List<String> pks = new ArrayList<>();
        pks.add(Constant.PRODUCT_KEY);
        GizWifiSDK.sharedInstance().getBoundDevices(currUser.getUid(), currUser.getToken(), pks);
    }


    @OnClick(R.id.tv_add_device)
    public void addDevice() {
        if (!NetUtils.isWifiConnected(this)) {
            DialogUtils.showNoWifiDialog(this);
        } else {
            startActivity(ConfigSearchActivity.class, false);
        }
    }

    @OnClick(R.id.tvBaseBarLeft)
    public void barLeftClick() {
        if (viewDelegate.isBack) { //后退
            viewDelegate.wvControl.getNavigationHistory().navigate(XWalkNavigationHistory.Direction.BACKWARD, 1);//返回上一页面
        } else if (MyApplication.getInstance().getCurrDevice() == null) { //没有设备
            userInfo();
        } else { //菜单
            viewDelegate.showMenu();
        }
    }

    public void barRightClick() {
        loadJs("rightAction()");
    }

    @Override
    public void onBackPressed() {

        if (!viewDelegate.isOpenMenu()) {

            if (hasPressBack) {
                XAppManager.getInstance().AppExit(this, false);
            } else {
                hasPressBack = true;
                showToast(getString(R.string.exit_app));
                Observable.timer(1500, TimeUnit.MILLISECONDS).subscribe(new Action1<Long>() {
                    @Override
                    public void call(Long aLong) {
                        hasPressBack = false;
                    }
                });
            }
        }
    }


    @Override
    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.rb_device: //设备选择
                int position = (int) v.getTag();
                GizWifiDevice selectDeivce = MyApplication.getInstance().getBindDevices().get(position);
                SharedPreferencesHelper.getInstance(this).putStringValue(Keys.DEVICE_CHECK, selectDeivce.getMacAddress());
                MyApplication.getInstance().setCurrDevice(selectDeivce);
                viewDelegate.notifyDevice();
                break;
        }
    }

    @Override
    public void didReceiveData(GizWifiDevice device, DeviceStatus deviceStatus) {
        super.didReceiveData(device, deviceStatus);

        viewDelegate.initDeviceInfo();
    }

    @Override
    public void did4ActivityDiscovered(GizWifiErrorCode error, List<GizWifiDevice> devicesList) {
        super.did4ActivityDiscovered(error, devicesList);
        viewDelegate.notifyDevice();

    }


    /*********************  xwalkview  *****************/

    @SuppressLint("JavascriptInterface")
    public void initWebView() {

        viewDelegate.wvControl.setResourceClient(new XWalkResourceClient(viewDelegate.wvControl) {
            @Override
            public void onLoadFinished(XWalkView view, String url) {
                super.onLoadFinished(view, url);
                viewDelegate.notifyDevice();

                loadJs("getUserInfoSuccess(" + UserService.getUserInfo() +")");
                loadJs("getAppInfoSuccess(" + CommonUtils.getAPPInfo() +")");

            }

            @Override
            public void onLoadStarted(XWalkView view, String url) {
                super.onLoadStarted(view, url);
            }
        });

        viewDelegate.wvControl.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                return false;
            }
        });

        XWalkSettings webSettings = viewDelegate.wvControl.getSettings();
        webSettings.setJavaScriptEnabled(true);
        viewDelegate.wvControl.addJavascriptInterface(MainActivity.this, "jsObj");
        viewDelegate.wvControl.load("file:///android_asset/" + "html/" + "index.html#/mobile/deviceinfo", null);
    }

    public void loadJs(String js) {
        viewDelegate.wvControl.load("javascript: " + js, null);
    }

    @org.xwalk.core.JavascriptInterface
    public void sendCmd(String cmdJson) {
        MLog.log("cmd", cmdJson);
        try {
            JSONObject jsonObject = new JSONObject(cmdJson);
            Iterator it = jsonObject.keys();
            CmdUtils cmdUtils = new CmdUtils();
            while (it.hasNext()) {
                String key = (String) it.next();
                Object value = jsonObject.get(key);
                cmdUtils.add(key, value);
            }
            cmdUtils.write();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @org.xwalk.core.JavascriptInterface
    public void getDeviceStatus() {
        GizWifiDevice currDevice = MyApplication.getInstance().getCurrDevice();
        if (currDevice != null) {
            currDevice.getDeviceStatus();
        }
    }

    @org.xwalk.core.JavascriptInterface
    public void setTitle(final String title) {
        MLog.log("标题", title + "");

    }


    @org.xwalk.core.JavascriptInterface
    public void setLeftBarButton(int style) {
        MLog.log("左按钮", style + "");
        viewDelegate.isBack = style == 1;
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                viewDelegate.initDeviceInfo();
            }
        });
    }

    @org.xwalk.core.JavascriptInterface
    public void setRightBarButton(final int style) {
        MLog.log("右按钮", style + "");
    }

    /*********************  xwalkview  *****************/
}
