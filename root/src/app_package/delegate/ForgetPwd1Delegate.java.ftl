package ${packageName}.delegate;

import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.R;


public class ForgetPwd1Delegate extends BaseDelegate<BaseViewTitle> {

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_forget_pwd1;
    }

    @Override
    public void initWidget() {

        initBaseTitleBar(getString(R.string.forget_pwd));
    }
}


