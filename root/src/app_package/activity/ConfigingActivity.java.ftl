package ${packageName}.activity;

import android.os.Bundle;
import android.view.View;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiConfigureMode;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import com.gizwits.gizwifisdk.enumration.GizWifiGAgentType;
import ${packageName}.Constant;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ConfigingDelegate;
import com.mai.xmai_fast_lib.utils.MLog;
import com.mai.xmai_fast_lib.utils.XAppManager;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import butterknife.OnClick;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;


public class ConfigingActivity extends BaseActivity<ConfigingDelegate> {


    String ssid;
    String password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ssid = getIntent().getStringExtra("wifi");
        password = getIntent().getStringExtra("password");
        configDevice();
    }

    @Override
    public void onBackPressed() {
        if (viewDelegate.get(R.id.tvBaseBarLeft).getVisibility() == View.VISIBLE) {
            super.onBackPressed();
        }
    }

    public void configDevice() {
        viewDelegate.startConnect();
        List<GizWifiGAgentType> types = new ArrayList<>();
//        types.add(GizWifiGAgentType.GizGAgentHF);
        GizWifiSDK.sharedInstance().setDeviceOnboarding(ssid, password, GizWifiConfigureMode.GizWifiAirLink, null, 60, types);
    }


    @Override
    public void did4ActivitySetDeviceWifi(GizWifiErrorCode error, String mac, String did, String productKey) {
        super.did4ActivitySetDeviceWifi(error, mac, did, productKey);

        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            MLog.log("配置成功");
            GizWifiSDK.sharedInstance().bindRemoteDevice(MyApplication.getInstance().getCurrUser().getUid(),
                    MyApplication.getInstance().getCurrUser().getToken(),
                    mac, productKey, Constant.PRODUCT_SECRET);
        } else {
            MLog.log("配置失败");
            configFail();
        }
    }

    @Override
    public void did4ActivityBindDevice(GizWifiErrorCode error, String errorMessage, String did) {
        super.did4ActivityBindDevice(error, errorMessage, did);
        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            configSucc();
        } else {
            configFail();
        }
    }

    public void configSucc() {
        MLog.log("绑定成功");
        viewDelegate.connectSuccess();

        rx.Observable.timer(2000, TimeUnit.MILLISECONDS, AndroidSchedulers.mainThread()).map(new Func1<Long, Object>() {
            @Override
            public Object call(Long aLong) {
                XAppManager.getInstance().finishActivity(ConfigSearchActivity.class);
                finish();
                return null;
            }
        }).subscribe();
    }

    public void configFail() {
        viewDelegate.connectFail();
    }

    @OnClick(R.id.tv_reconfig)
    public void reConfig() {
        startActivity(ConfigWifiActivity.class, true);
    }

    @Override
    protected void onDestroy() {
        if (viewDelegate.subscription != null)
            viewDelegate.subscription.unsubscribe();
        super.onDestroy();
    }
}


