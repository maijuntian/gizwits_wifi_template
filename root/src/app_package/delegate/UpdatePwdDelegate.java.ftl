package ${packageName}.delegate;

import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.R;


public class UpdatePwdDelegate extends BaseDelegate<BaseViewTitle> {

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_update_pwd;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(getString(R.string.set_pwd));
    }
}


