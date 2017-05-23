package ${packageName}.delegate;

import android.widget.TextView;

import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.bean.User;
import com.mai.xmai_fast_lib.utils.MLog;

import butterknife.Bind;


public class UserInfoDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.tv_phone)
    TextView tvPhone;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_user_info;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(R.string.user_info);
    }

    public void initUserInfo() {
        User user = MyApplication.getInstance().getCurrUser();
        MLog.log("用户信息：" + user.toString());
        if (user != null) {
            tvPhone.setText(user.getPhone());
        }
    }
}


