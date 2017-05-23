package ${packageName}.delegate;

import android.widget.TextView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.utils.CommonUtils;

import butterknife.Bind;


public class DeviceEditDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.tv_device_name)
    public TextView tvDeviceName;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_device_edit;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(mContext.getString(R.string.edit_device));
    }

    public void initDevice(GizWifiDevice deivce) {
        tvDeviceName.setText(CommonUtils.getDeviceName(deivce));
    }
}


