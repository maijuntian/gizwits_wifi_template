package ${packageName}.delegate;

import android.widget.ListView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.utils.CommonUtils;
import ${packageName}.utils.Keys;
import com.mai.xmai_fast_lib.baseadapter.BaseListViewAdapter;
import com.mai.xmai_fast_lib.baseadapter.BaseViewHolder;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;

import java.util.List;

import butterknife.Bind;


public class DeviceManagerDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.lv_device)
    ListView lvDevice;
    private BaseListViewAdapter<GizWifiDevice> deviceAdapter;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_device_manager;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(getString(R.string.device_manager), "", R.mipmap.nav_ic_add);
    }

    public void notifyDevice() {
        if (deviceAdapter == null) {
            List<GizWifiDevice> devies = MyApplication.getInstance().getBindDevices();
            deviceAdapter = new BaseListViewAdapter<GizWifiDevice>(devies) {
                @Override
                protected int bindLayoutId(int position) {
                    return R.layout.item_device_searching;
                }

                @Override
                protected void initView(GizWifiDevice data, BaseViewHolder viewHolder) {
                    viewHolder.setText(R.id.tv_device, CommonUtils.getDeviceName(data));
                }
            };
            lvDevice.setAdapter(deviceAdapter);
        } else {
            deviceAdapter.notifyDataSetChanged();
        }

    }
}


