package ${packageName}.activity;

import android.net.Uri;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.XDBManager;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.UserInfoDelegate;
import ${packageName}.utils.DialogUtils;
import com.mai.xmai_fast_lib.utils.XAppManager;

import butterknife.OnClick;
import rx.functions.Action0;


public class UserInfoActivity extends BaseActivity<UserInfoDelegate> {


    @Override
    protected void onResume() {
        super.onResume();

        viewDelegate.initUserInfo();
    }

    @Override
    public boolean isStatusBarTranslucent() {
        return false;
    }

    @OnClick(R.id.tvBaseBarLeft)
    public void back() {
        finish();
    }

    @OnClick(R.id.rl_set_pwd)
    public void setPwd() {
        startActivity(UpdatePwdActivity.class, false);
    }


    @OnClick(R.id.tv_logout)
    public void logout() {
        DialogUtils.showSelectDialog(this, getString(R.string.confirm_logout), R.mipmap.configure_ic_success, new Action0() {

            @Override
            public void call() {
                XDBManager.getUserDao().deleteAll();
                MyApplication.getInstance().setCurrUser(null);
                MyApplication.getInstance().setCurrDevice(null);
                XAppManager.getInstance().finishActivity(MainActivity.class);
                startActivity(LoginActivity.class, true);
            }
        });
    }

}


