package ${packageName}.activity;

import android.os.Bundle;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.DeviceEditDelegate;
import ${packageName}.utils.CommonUtils;
import ${packageName}.utils.DialogUtils;
import com.mai.xmai_fast_lib.utils.MLog;

import butterknife.OnClick;
import rx.functions.Action0;
import rx.functions.Action1;


public class DeviceEditActivity extends BaseActivity<DeviceEditDelegate> {

    GizWifiDevice mDevice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mDevice = MyApplication.getInstance().getBindDevices().get(getIntent().getIntExtra("position", 0));

        viewDelegate.initDevice(mDevice);
    }

    @OnClick(R.id.tv_delete_device)
    public void deleteDevice() {
        DialogUtils.showSelectDialog(this, getString(R.string.confirm_delete_device), 0, new Action0() {
            @Override
            public void call() {
                showLoadingDialog();
                GizWifiSDK.sharedInstance().unbindDevice(MyApplication.getInstance().getCurrUser().getUid(), MyApplication.getInstance().getCurrUser().getToken(), mDevice.getDid());
            }
        });
    }

    @OnClick(R.id.tv_share_device)
    public void shareDevice() {
        Bundle bundle = new Bundle();
        bundle.putString("did", mDevice.getDid());
        startActivity(ShareDeviceActivity.class, bundle, false);
    }

    @OnClick(R.id.tv_device_name)
    public void updateName() {
        DialogUtils.showUpdateNameDialog(this, CommonUtils.getDeviceName(mDevice), new Action1<String>() {
            @Override
            public void call(String name) {
                showLoadingDialog();
                mDevice.setCustomInfo("", name);
            }
        });
    }

    @Override
    public void did4ActivityUnbindDevice(GizWifiErrorCode error, String errorMessage, String did4Activity) {
        super.did4ActivityUnbindDevice(error, errorMessage, did4Activity);
        dismissLoadingDialog();
        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            showToast(R.string.unbind_succ);
            finish();
        } else {
            showToast(R.string.unbind_fail);
        }
    }

    @Override
    public void didSetCustomInfo(GizWifiErrorCode result, GizWifiDevice device) {
        MLog.log("设备：" + device.getAlias() + " " + device.getRemark());
        dismissLoadingDialog();
        if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            viewDelegate.initDevice(mDevice);
        } else {
            showToast(R.string.update_fail);
        }
    }
}


