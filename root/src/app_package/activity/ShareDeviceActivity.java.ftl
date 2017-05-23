package ${packageName}.activity;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;

import com.gizwits.gizwifisdk.api.GizDeviceSharing;
import com.gizwits.gizwifisdk.api.GizUserInfo;
import com.gizwits.gizwifisdk.enumration.GizDeviceSharingWay;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.bean.User;
import ${packageName}.delegate.ShareDeviceDelegate;
import ${packageName}.utils.DialogUtils;

import java.util.List;

import rx.functions.Action0;


public class ShareDeviceActivity extends BaseActivity<ShareDeviceDelegate> {

    String mToken, mDid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mToken = MyApplication.getInstance().getCurrUser().getToken();
        mDid = getIntent().getStringExtra("did");
        GizDeviceSharing.sharingDevice(mToken, mDid, GizDeviceSharingWay.GizDeviceSharingByQRCode, null, null);
        GizDeviceSharing.getBindingUsers(mToken, mDid);

    }


    @Override
    public void did4ActivitySharingDevice(GizWifiErrorCode result, String deviceID, int sharingID, Bitmap QRCodeImage) {
        super.did4ActivitySharingDevice(result, deviceID, sharingID, QRCodeImage);

        if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            viewDelegate.ivQrcode.setImageBitmap(QRCodeImage);
        } else {
            showToast(getString(R.string.get_share_qrcode_error));
        }
    }

    @Override
    public void did4ActivityGetBindingUsers(GizWifiErrorCode result, String deviceID, List<GizUserInfo> bindUsers) {
        super.did4ActivityGetBindingUsers(result, deviceID, bindUsers);
        dismissLoadingDialog();
        viewDelegate.initUsers(bindUsers);
    }

    @Override
    public void onClick(View v) {
        final String uid = (String) v.getTag();

        DialogUtils.showSelectDialog(this, getString(R.string.sure_unbind_device), 0, new Action0() {
            @Override
            public void call() {

                showLoadingDialog();
                GizDeviceSharing.unbindUser(mToken, mDid, uid);
            }
        });
    }
}


