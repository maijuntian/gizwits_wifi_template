package ${packageName}.activity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.Constant;
import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.DeviceManagerDelegate;
import ${packageName}.bean.User;
import ${packageName}.utils.DialogUtils;
import ${packageName}.utils.NetUtils;

import java.util.ArrayList;
import java.util.List;

import butterknife.OnClick;
import butterknife.OnItemClick;


public class DeviceManagerActivity extends BaseActivity<DeviceManagerDelegate> {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        User currUser = MyApplication.getInstance().getCurrUser();
        List<String> pks = new ArrayList<>();
        pks.add(Constant.PRODUCT_KEY);
        GizWifiSDK.sharedInstance().getBoundDevices(currUser.getUid(), currUser.getToken(), pks);

        viewDelegate.notifyDevice();
    }

    @Override
    public void did4ActivityDiscovered(GizWifiErrorCode error, List<GizWifiDevice> devicesList) {
        super.did4ActivityDiscovered(error, devicesList);

        viewDelegate.notifyDevice();
    }

    @OnClick(R.id.tvBaseBarRight)
    public void addDevice() {
        if (!NetUtils.isWifiConnected(this)) {
            DialogUtils.showNoWifiDialog(this);
        } else {
            startActivity(ConfigSearchActivity.class, false);
        }
    }

    @OnItemClick(R.id.lv_device)
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Bundle bundle = new Bundle();
        bundle.putInt("position", position);
        startActivity(DeviceEditActivity.class, bundle, false);
    }
}


