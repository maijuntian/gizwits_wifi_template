package ${packageName}.activity;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizUserAccountType;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.R;
import ${packageName}.XDBManager;
import ${packageName}.base.BaseActivity;
import ${packageName}.bean.User;
import ${packageName}.delegate.RegisterDelegate;
import ${packageName}.utils.GIzErrorHelper;
import ${packageName}.widget.VerificationTextView;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;
import com.mai.xmai_fast_lib.utils.XAppManager;

import butterknife.Bind;
import butterknife.OnClick;

public class RegisterActivity extends BaseActivity<RegisterDelegate> {
    @Bind(R.id.et_password)
    EditText etPassword;
    @Bind(R.id.et_phone)
    EditText etPhone;
    @Bind(R.id.et_phone_code)
    EditText etCode;
    @Bind(R.id.tv_get_code)
    VerificationTextView tvGetCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @OnClick(R.id.tv_get_code)
    public void sendSms() {
        String phone = etPhone.getText().toString().trim();

        showLoadingDialog();
        GizWifiSDK.sharedInstance().requestSendPhoneSMSCode(Constant.APP_SECRET, phone);
    }

    @OnClick(R.id.tv_register)
    public void register() {
        String phone = etPhone.getText().toString().trim();
        String code = etCode.getText().toString().trim();
        final String password1 = etPassword.getText().toString().trim();
        if (TextUtils.isEmpty(phone)) {
            showToast(R.string.please_input_phone);
            return;
        }
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
        GizWifiSDK.sharedInstance().registerUser(phone, password1, code, GizUserAccountType.GizUserPhone);

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
    public void did4ActivityRegisterUser(GizWifiErrorCode error, String errorMessage, String uid, String token) {
        dismissLoadingDialog();
        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) { //注册成功
            showToast(getString(R.string.register_succ));
            tvGetCode.stopCountDown();
            User mUser = new User();
            mUser.setToken(token);
            mUser.setUid(uid);
            mUser.setPassword(etPassword.getText().toString());
            mUser.setUsername(etPhone.getText().toString());
            mUser.setPhone(etPhone.getText().toString());
            SharedPreferencesHelper.getInstance(getApplicationContext()).putStringValue("phone", mUser.getPhone());
            XDBManager.getUserDao().deleteAll();
            XDBManager.getUserDao().insert(mUser);

            XAppManager.getInstance().finishActivity(LoginActivity.class);
            startActivity(MainActivity.class, true);
        } else { //注册失败
            GIzErrorHelper.showError(error);
        }
    }

    @Override
    protected void onDestroy() {
        tvGetCode.startCountDown();
        super.onDestroy();
    }
}

