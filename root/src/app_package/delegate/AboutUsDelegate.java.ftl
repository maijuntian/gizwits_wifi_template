package ${packageName}.delegate;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;



public class AboutUsDelegate extends BaseDelegate<BaseViewTitle> {

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_about_us;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(R.string.about_us);
    }
}


