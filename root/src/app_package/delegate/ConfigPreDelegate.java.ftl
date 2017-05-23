package ${packageName}.delegate;

import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.ImageSpan;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;

import butterknife.Bind;


public class ConfigPreDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.tv_start_bind)
    TextView tvStartBind;
    @Bind(R.id.tv_config_alarm)
    TextView tvConfigAlarm;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_config_pre;
    }

    @Override
    public void initWidget() {
        super.initWidget();
        initBaseTitleBar(mContext.getString(R.string.config_device));

        ImageSpan imageSpan = new ImageSpan(mContext, R.mipmap.configure_ic_light);
        SpannableString spanStr = new SpannableString(mContext.getString(R.string.config_pre_alarm));

        spanStr.setSpan(imageSpan, 8, 9, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);

        tvConfigAlarm.setText(spanStr);
    }
}


