package ${packageName}.activity;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizUserAccountType;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ForgetPwd2Delegate;
import ${packageName}.utils.GIzErrorHelper;
import ${packageName}.utils.MToast;
import ${packageName}.widget.VerificationTextView;


import java.util.concurrent.TimeUnit;

import butterknife.Bind;
import butterknife.OnClick;
import rx.Observable;
import rx.functions.Action1;


public class ForgetPwd2Activity extends BaseActivity<ForgetPwd2Delegate> {

    String mPhone;


    @Bind(R.id.et_phone_code)
    EditText etPhoneCode;
    @Bind(R.id.tv_get_code)
    VerificationTextView tvGetCode;
    @Bind(R.id.et_new_password)
    EditText etNewPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tvGetCode.startCountDown();
        mPhone = getIntent().getStringExtra("phone");
    }

    @OnClick(R.id.tv_get_code)
    public void sendSms() {
        showLoadingDialog();
        GizWifiSDK.sharedInstance().requestSendPhoneSMSCode(Constant.APP_SECRET, mPhone);
    }

    @OnClick(R.id.tv_confirm)
    public void confirm() {
        String code = etPhoneCode.getText().toString().trim();
        String password1 = etNewPassword.getText().toString().trim();
        if (TextUtils.isEmpty(code)) {
            showToast(R.string.please_input_code);
            return;
        }
        if (TextUtils.isEmpty(password1)) {
            showToast(R.string.please_input_pwd);
            return;
        }

        if (password1.length() < 6) {
            showToast(getString(R.string.pwd_length_less_six));
            return;
        }
        showLoadingDialog();
        GizWifiSDK.sharedInstance().resetPassword(mPhone, code, password1, GizUserAccountType.GizUserPhone);

    }

    @Override
    public void did4ActivityRequestSendPhoneSMSCode(GizWifiErrorCode result, String errorMessage) {
        dismissLoadingDialog();
        if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            // 请求成功
            showToast(getString(R.string.send_sms_succ));
            tvGetCode.startCountDown();
        } else {
            // 请求失败
            showToast(getString(R.string.send_sms_fail));
        }
    }

    @Override
    public void did4ActivityChangeUserPassword(GizWifiErrorCode error, String errorMessage) {
        super.did4ActivityChangeUserPassword(error, errorMessage);

        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            tvGetCode.stopCountDown();
            MToast.makeText(ForgetPwd2Activity.this, getString(R.string.has_set_new_password), 2000).show();
            Observable.timer(2000, TimeUnit.MILLISECONDS).subscribe(new Action1<Long>() {
                @Override
                public void call(Long aLong) {
                    finish();
                }
            });
        } else {
            GIzErrorHelper.showError(error);
        }
    }

    @Override
    protected void onDestroy() {
        tvGetCode.startCountDown();
        super.onDestroy();
    }
}


