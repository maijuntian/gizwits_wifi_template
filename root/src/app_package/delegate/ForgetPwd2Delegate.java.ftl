package ${packageName}.delegate;

import android.widget.EditText;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.widget.VerificationTextView;

import butterknife.Bind;


public class ForgetPwd2Delegate extends BaseDelegate<BaseViewTitle> {

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_forget_pwd2;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(getString(R.string.forget_pwd));
    }
}


