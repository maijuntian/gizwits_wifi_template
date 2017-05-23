package ${packageName}.delegate;

import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.R;


public class ConfigWifiDelegate extends BaseDelegate<BaseViewTitle> {

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_config_wifi;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(mContext.getString(R.string.input_pwd));
    }
}


