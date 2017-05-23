package ${packageName}.delegate;

import android.support.v4.widget.DrawerLayout;
import android.view.Gravity;
import android.view.View;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.XDBManager;
import ${packageName}.activity.MainActivity;
import ${packageName}.bean.DeviceStatus;
import ${packageName}.utils.CommonUtils;
import ${packageName}.utils.Keys;
import com.mai.xmai_fast_lib.baseadapter.BaseListViewAdapter;
import com.mai.xmai_fast_lib.baseadapter.BaseViewHolder;
import com.mai.xmai_fast_lib.mvvm.view.AppDelegate;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;

import org.xwalk.core.XWalkView;

import java.util.List;

import butterknife.Bind;

/**
 * Created by mai on 17/4/18.
 */

public class MainDelegate extends AppDelegate {

    @Bind(R.id.drawerlayout)
    DrawerLayout drawerlayout;

    @Bind(R.id.lv_device)
    ListView lvDevice;
    @Bind(R.id.divider_menu)
    View dividerMenu;


    BaseListViewAdapter<GizWifiDevice> deviceAdapter;

    @Bind(R.id.tv_device_list)
    TextView tvDeviceList;
    @Bind(R.id.wv_control)
    public XWalkView wvControl;
    @Bind(R.id.tvBaseBarLeft)
    public TextView tvBaseBarLeft;
    @Bind(R.id.tvBaseBarTitle)
    public TextView tvBaseBarTitle;
    @Bind(R.id.tvBaseBarRight)
    public TextView tvBaseBarRight;
    @Bind(R.id.rl_title)
    RelativeLayout rlTitle;
    @Bind(R.id.tv_alarm)
    TextView tvAlarm;
    @Bind(R.id.rl_refresh)
    RelativeLayout rlRefresh;
    @Bind(R.id.tv_add_device)
    TextView tvAddDevice;
    @Bind(R.id.rl_no_device)
    RelativeLayout rlNoDevice;
    @Bind(R.id.tv_device_manager)
    TextView tvDeviceManager;
    @Bind(R.id.tv_user_info)
    TextView tvUserInfo;
    @Bind(R.id.tv_about)
    TextView tvAbout;
    public DeviceStatus currStatus;

    public boolean isBack;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_main;
    }

    @Override
    public void initWidget() {
        super.initWidget();

        drawerlayout.addDrawerListener(new DrawerLayout.SimpleDrawerListener() {
            @Override
            public void onDrawerSlide(View drawerView, float slideOffset) {
                // TODO Auto-generated method stub
                super.onDrawerSlide(drawerView, slideOffset);
                drawerlayout.bringChildToFront(drawerView);
                drawerlayout.requestLayout();
            }
        });
    }

    public void showMenu() {
        drawerlayout.openDrawer(Gravity.LEFT);
    }

    public boolean isOpenMenu() {
        if (drawerlayout.isDrawerOpen(Gravity.LEFT)) {
            drawerlayout.closeDrawers();
            return true;
        }
        return false;
    }

    public void switchDeviceList() {
        if (lvDevice.getVisibility() == View.VISIBLE) {
            hideDeviceList();
        } else {
            showDeviceList();
        }
    }

    public void showDeviceList() {

        tvDeviceList.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.menu_ic_devicelist, 0, R.mipmap.list_ic_arrow_down, 0);
        dividerMenu.setVisibility(View.VISIBLE);
        lvDevice.setVisibility(View.VISIBLE);

    }

    public void hideDeviceList() {

        tvDeviceList.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.menu_ic_devicelist, 0, R.mipmap.list_ic_arrow, 0);
        dividerMenu.setVisibility(View.GONE);
        lvDevice.setVisibility(View.GONE);
    }

    public void notifyDevice() {
        if (deviceAdapter == null) {
            List<GizWifiDevice> devies = MyApplication.getInstance().getBindDevices();
            deviceAdapter = new BaseListViewAdapter<GizWifiDevice>(devies) {
                @Override
                protected int bindLayoutId(int position) {
                    return R.layout.item_menu_device;
                }

                @Override
                protected void initView(GizWifiDevice data, BaseViewHolder viewHolder) {
                    viewHolder.setText(R.id.rb_device, CommonUtils.getDeviceName(data))
                            .setChecked(R.id.rb_device, data == MyApplication.getInstance().getCurrDevice())
                            .setTag(R.id.rb_device, viewHolder.getPosition())
                            .setOnClickListener(mOnClickListener, R.id.rb_device);
                }
            };
            lvDevice.setAdapter(deviceAdapter);
            showDeviceList();
            hideDeviceList();
        } else {
            deviceAdapter.notifyDataSetChanged();
        }

        initDeviceInfo();
    }


    public void initDeviceInfo() {

        GizWifiDevice currDevice = MyApplication.getInstance().getCurrDevice();
        if (currDevice == null) { //没有设备
            tvBaseBarTitle.setText(getString(R.string.add_device));
            tvBaseBarLeft.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.menu_ic_user, 0, 0, 0);
            rlNoDevice.setVisibility(View.VISIBLE);
            wvControl.setVisibility(View.GONE);
            tvAlarm.setText(R.string.no_add_device);
            rlRefresh.setVisibility(View.VISIBLE);
            tvAddDevice.setVisibility(View.VISIBLE);
        } else if (!CommonUtils.isOnline(currDevice)) { //设备离线
            tvBaseBarTitle.setText(CommonUtils.getDeviceName(currDevice));
            tvBaseBarLeft.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.nav_ic_menu, 0, 0, 0);
            rlNoDevice.setVisibility(View.GONE);
            wvControl.setVisibility(View.VISIBLE);
            rlRefresh.setVisibility(View.GONE);
            tvAddDevice.setVisibility(View.GONE);
            ((MainActivity) mContext).loadJs("showFromDeviceState(" + CommonUtils.getOnlineStatus(currDevice) + ")");
        } else { // 有设备
            ((MainActivity) mContext).loadJs("showFromDeviceState(" + CommonUtils.getOnlineStatus(currDevice) + ")");
            tvBaseBarLeft.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.nav_ic_menu, 0, 0, 0);
            tvBaseBarTitle.setText(CommonUtils.getDeviceName(currDevice));
            rlNoDevice.setVisibility(View.GONE);
            currStatus = MyApplication.getInstance().getCurrStatus();
            if (currStatus == null) { //没有状态
                wvControl.setVisibility(View.GONE);
            } else { //有状态
                ((MainActivity) mContext).loadJs("showFromDeviceResponse(" + currStatus.getStatusJson() + ")");
                if (isBack) { //需要返回
                    tvBaseBarLeft.setCompoundDrawablesWithIntrinsicBounds(R.mipmap.nav_ic_back2, 0, 0, 0);
                }
                wvControl.setVisibility(View.VISIBLE);
            }
        }
    }
}
