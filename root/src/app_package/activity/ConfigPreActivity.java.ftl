package ${packageName}.activity;

import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ConfigPreDelegate;
import com.mai.xmai_fast_lib.utils.XAppManager;

import butterknife.OnClick;


public class ConfigPreActivity extends BaseActivity<ConfigPreDelegate> {

    @OnClick(R.id.tv_start_bind)
    public void config() {
        startActivity(ConfigingActivity.class, getIntent().getExtras(), true);
        XAppManager.getInstance().finishActivity();
    }
}


