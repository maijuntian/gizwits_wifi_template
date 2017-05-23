package ${packageName}.activity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ConfigSearchDelegate;

import java.util.List;

import butterknife.OnClick;
import butterknife.OnItemClick;


public class ConfigSearchActivity extends BaseActivity<ConfigSearchDelegate> {

    boolean isBind = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        viewDelegate.notifyDevices();
    }

    @OnClick(R.id.tv_config)
    public void config() {
        startActivity(ConfigWifiActivity.class, false);
    }

    @OnItemClick(R.id.lv_device)
    public void bind(AdapterView<?> parent, View view, int position, long id) {
        showLoadingDialog();
        isBind = true;
        GizWifiSDK.sharedInstance().bindRemoteDevice(MyApplication.getInstance().getCurrUser().getUid(),
                MyApplication.getInstance().getCurrUser().getToken(),
                MyApplication.getInstance().getUnBindDevices().get(position).getMacAddress(), Constant.PRODUCT_KEY, Constant.PRODUCT_SECRET);
    }

    @OnClick(R.id.tv_qrcode_add)
    public void addByQrcode() {
        startActivity(ScanQrActivity.class, false);
    }

    @Override
    public void did4ActivityDiscovered(GizWifiErrorCode error, List<GizWifiDevice> devicesList) {
        super.did4ActivityDiscovered(error, devicesList);
        viewDelegate.notifyDevices();
    }

    @Override
    public void did4ActivityBindDevice(final GizWifiErrorCode error, String errorMessage, String did) {
        super.did4ActivityBindDevice(error, errorMessage, did);
        if (!isBind)
            return;
        isBind = false;
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                dismissLoadingDialog();
                if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
                    showToast(getString(R.string.bind_succ));
                    finish();
                } else {
                    showToast(getString(R.string.bind_fail));
                }
            }
        });
    }

}


