package ${packageName}.activity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.ConfigWifiDelegate;
import ${packageName}.utils.DialogUtils;
import ${packageName}.utils.NetUtils;

import butterknife.Bind;
import butterknife.OnClick;


public class ConfigWifiActivity extends BaseActivity<ConfigWifiDelegate> {

    @Bind(R.id.tv_wifi)
    TextView tvWifiName;

    @Bind(R.id.et_wifi_pwd)
    EditText etPassword;

    NetworkConnectChangedReceiver receiver;

    public class NetworkConnectChangedReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (ConnectivityManager.CONNECTIVITY_ACTION.equals(action)) {
                NetworkInfo ni = intent.getParcelableExtra(WifiManager.EXTRA_NETWORK_INFO);
                if (ni.getState() == NetworkInfo.State.CONNECTED && ni.getType() == ConnectivityManager.TYPE_WIFI) {
                    setWifiName(NetUtils.getCurentWifiSSID(ConfigWifiActivity.this));
                } else {
                    setWifiName("");
                }
            }
        }
    }

    private void setWifiName(final String s) {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                tvWifiName.setText("Wi-Fi: " + s);
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        /**
         * 注册广播
         */
        IntentFilter filter = new IntentFilter();
        filter.addAction(WifiManager.NETWORK_STATE_CHANGED_ACTION);
        filter.addAction(WifiManager.WIFI_STATE_CHANGED_ACTION);
        filter.addAction(ConnectivityManager.CONNECTIVITY_ACTION);
        receiver = new NetworkConnectChangedReceiver();
        registerReceiver(receiver, filter);


        setWifiName(NetUtils.getCurentWifiSSID(ConfigWifiActivity.this));
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(receiver);
    }

    @OnClick(R.id.tv_next)
    public void next() {
        String wifi = tvWifiName.getText().toString();
        if (TextUtils.isEmpty(wifi)) {
            DialogUtils.showDialog(ConfigWifiActivity.this, getString(R.string.please_connect_wifi), null);
            return;
        }

        Bundle bundle = new Bundle();
        bundle.putString("wifi", tvWifiName.getText().toString());
        bundle.putString("password", etPassword.getText().toString());

        startActivity(ConfigPreActivity.class, bundle, false);
    }
}


