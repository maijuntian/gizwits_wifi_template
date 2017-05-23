package ${packageName}.activity;

import android.os.Bundle;
import android.widget.EditText;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ForgetPwd1Delegate;

import butterknife.Bind;
import butterknife.OnClick;


public class ForgetPwd1Activity extends BaseActivity<ForgetPwd1Delegate> {

    @Bind(R.id.et_phone)
    EditText etPhone;

    @OnClick(R.id.tv_get_code)
    public void sendSms() {
        String phone = etPhone.getText().toString().trim();

        showLoadingDialog();
        GizWifiSDK.sharedInstance().requestSendPhoneSMSCode(Constant.APP_SECRET, phone);
    }

    @Override
    public void did4ActivityRequestSendPhoneSMSCode(GizWifiErrorCode result, String errorMessage) {
        dismissLoadingDialog();
        if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            // 请求成功
            showToast(getString(R.string.send_sms_succ));
            Bundle bundle = new Bundle();
            bundle.putString("phone",  etPhone.getText().toString().trim());
            startActivity(ForgetPwd2Activity.class, bundle, true);
        } else {
            // 请求失败
            showToast(getString(R.string.send_sms_fail));
        }
    }
}


