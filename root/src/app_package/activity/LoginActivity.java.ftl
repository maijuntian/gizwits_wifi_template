package ${packageName}.activity;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.XDBManager;
import ${packageName}.base.BaseActivity;
import ${packageName}.bean.User;
import ${packageName}.delegate.LoginDelegate;
import ${packageName}.utils.GIzErrorHelper;
import ${packageName}.utils.Keys;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;

import butterknife.Bind;
import butterknife.OnClick;

/**
 * Created by mai on 16/10/14.
 */
public class LoginActivity extends BaseActivity<LoginDelegate> {


    @Bind(R.id.et_account)
    EditText etAccount;
    @Bind(R.id.et_password)
    EditText etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String phone = SharedPreferencesHelper.getInstance(getApplicationContext()).getStringValue(Keys.USER_ACCOUNT);
        if (!TextUtils.isEmpty(phone)) {
            etAccount.setText(phone);
            etAccount.setSelection(phone.length());
        }
    }

    @Override
    public boolean isStatusBarTranslucent() {
        return false;
    }

    @OnClick(R.id.tv_register)
    public void register() {
        startActivity(RegisterActivity.class, false);
    }

    @OnClick(R.id.tv_forget_pwd)
    public void reset() {
        startActivity(ForgetPwd1Activity.class, false);
    }

    @OnClick(R.id.tv_login)
    public void login() {
        String phone = etAccount.getText().toString();
        String password = etPassword.getText().toString();
        if (TextUtils.isEmpty(phone)) {
            showToast(R.string.please_input_phone);
            return;
        }
        if (TextUtils.isEmpty(password)) {
            showToast(R.string.please_input_pwd);
            return;
        }
        showLoadingDialog();

        GizWifiSDK.sharedInstance().userLogin(phone, password);
    }

    @Override
    public void did4ActivityUserLogin(GizWifiErrorCode error, String errorMessage, String uid, String token) {
        dismissLoadingDialog();
        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            User mUser = new User();
            mUser.setToken(token);
            mUser.setUid(uid);
            mUser.setPhone(etAccount.getText().toString());
            mUser.setPassword(etPassword.getText().toString());

            SharedPreferencesHelper.getInstance(getApplicationContext()).putStringValue(Keys.USER_ACCOUNT, mUser.getPhone());
            MyApplication.getInstance().setCurrUser(mUser);
            XDBManager.getUserDao().deleteAll();
            XDBManager.getUserDao().insert(mUser);
            MyApplication.getInstance().initGizwitToken();

            startActivity(MainActivity.class, true);
        } else {
            GIzErrorHelper.showError(error);
        }
    }
}
