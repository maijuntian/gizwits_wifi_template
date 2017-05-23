package ${packageName}.delegate;

import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.utils.CommonUtils;
import com.mai.xmai_fast_lib.baseadapter.BaseListViewAdapter;
import com.mai.xmai_fast_lib.baseadapter.BaseViewHolder;

import java.util.List;

import butterknife.Bind;
import butterknife.OnClick;


public class ConfigSearchDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.tv_config)
    TextView tvConfig;
    @Bind(R.id.tv_search_alarm)
    TextView tvSearchAlarm;
    @Bind(R.id.lv_device)
    ListView lvDevice;
    private BaseListViewAdapter<GizWifiDevice> deviceAdapter;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_config_search;
    }


    @Override
    public void initWidget() {
        initBaseTitleBar(mContext.getString(R.string.search_device));
    }

    public void notifyDevices() {
        List<GizWifiDevice> devices = MyApplication.getInstance().getUnBindDevices();

        if (deviceAdapter == null) {
            deviceAdapter = new BaseListViewAdapter<GizWifiDevice>(devices) {

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

        if (devices.size() > 0) {
            tvSearchAlarm.setVisibility(View.GONE);
            lvDevice.setVisibility(View.VISIBLE);
        } else {

            tvSearchAlarm.setVisibility(View.VISIBLE);
            lvDevice.setVisibility(View.GONE);
        }
    }
}


