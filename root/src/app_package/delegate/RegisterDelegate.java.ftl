package ${packageName}.delegate;

import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.widget.VerificationTextView;
import com.mai.xmai_fast_lib.baseview.BaseViewDelegate;
import com.mai.xmai_fast_lib.mvvm.view.AppDelegate;

import butterknife.Bind;


public class RegisterDelegate extends BaseDelegate<BaseViewTitle>{

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_register;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(R.string.register);
    }
}


