package ${packageName}.activity;

import android.text.TextUtils;
import android.widget.EditText;

import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.UpdatePwdDelegate;
import ${packageName}.utils.GIzErrorHelper;

import butterknife.Bind;
import butterknife.OnClick;


public class UpdatePwdActivity extends BaseActivity<UpdatePwdDelegate> {


    @Bind(R.id.et_pwd)
    EditText pvPwd;

    @Bind(R.id.et_new_pwd1)
    EditText pvNewPwd1;

    @Bind(R.id.et_new_pwd2)
    EditText pvNewPwd2;

    @OnClick(R.id.tv_save)
    public void tvFinish() {
        String oldPwd = pvPwd.getText().toString();
        String pwd1 = pvNewPwd1.getText().toString();
        String pwd2 = pvNewPwd2.getText().toString();

        if (TextUtils.isEmpty(oldPwd)) {
            showToast(getString(R.string.please_input_old_pwd));
            return;
        }

        if (TextUtils.isEmpty(pwd1)) {
            showToast(getString(R.string.please_input_new_pwd));
            return;
        }

        if (pwd1.length() < 6) {
            showToast(getString(R.string.pwd_length_less_six));
            return;
        }
        if (TextUtils.isEmpty(pwd2)) {
            showToast(getString(R.string.input_confirm_pwd));
            return;
        }

        if (!pwd1.equals(pwd2)) {
            showToast(getString(R.string.pwd1_unequal_pwd2));
            return;
        }
        showLoadingDialog();
        GizWifiSDK.sharedInstance().changeUserPassword(MyApplication.getInstance().getCurrUser().getToken(), oldPwd, pwd1);

    }


    @Override
    public void did4ActivityChangeUserPassword(GizWifiErrorCode error, String errorMessage) {
        dismissLoadingDialog();
        if (error == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            showToast(R.string.pwd_has_update);
            finish();
        } else {
            GIzErrorHelper.showError(error);
        }
    }
}


