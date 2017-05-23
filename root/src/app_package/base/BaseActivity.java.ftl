package ${packageName}.base;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

import com.gizwits.gizwifisdk.api.GizDeviceScheduler;
import com.gizwits.gizwifisdk.api.GizDeviceSharingInfo;
import com.gizwits.gizwifisdk.api.GizMessage;
import com.gizwits.gizwifisdk.api.GizUserInfo;
import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.enumration.GizWifiDeviceNetStatus;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.R;
import ${packageName}.bean.DeviceStatus;
import ${packageName}.utils.Keys;
import ${packageName}.widget.LoadingDialog;
import ${packageName}.widget.SystemBarTintManager;
import com.mai.xmai_fast_lib.mvvm.presenter.ActivityPresenter;
import com.mai.xmai_fast_lib.mvvm.view.IDelegate;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;
import com.xtremeprog.xpgconnect.XPGWifiGroup;
import com.xtremeprog.xpgconnect.XPGWifiSSID;

import java.util.List;
import java.util.Locale;


/**
 * Created by mai on 16/7/27.
 */
public class BaseActivity<T extends IDelegate> extends ActivityPresenter<T> {

    LoadingDialog loadingDialog;

    private Animation mAnimation;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            //透明状态栏
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);

            if (isStatusBarTranslucent()) {
                SystemBarTintManager tintManager = new SystemBarTintManager(this);
                tintManager.setStatusBarTintEnabled(true);
                tintManager.setTintResource(tintColor());
            }
        }
        String language = SharedPreferencesHelper.getInstance(getApplicationContext()).getStringValue(Keys.LANGUAGE);
        if (!TextUtils.isEmpty(language))
            switchLanguage(language);
    }

    public void switchLanguage(String language) {
        Resources res = getResources();
        Configuration config = res.getConfiguration();
        DisplayMetrics dm = res.getDisplayMetrics();
        if (language.equals("en")) {
            config.locale = Locale.ENGLISH;
        } else {
            config.locale = Locale.SIMPLIFIED_CHINESE;
        }
        res.updateConfiguration(config, dm);
    }

    public int tintColor() {
        return R.color.white;
    }

    @Override
    protected void showToast(String msg) {
        Toast toast = Toast.makeText(this, msg, Toast.LENGTH_SHORT);
        toast.setGravity(Gravity.CENTER, 0, 0);
        toast.show();
    }

    protected void showLoadingDialog() {
        if (loadingDialog == null)
            loadingDialog = new LoadingDialog(this);
        loadingDialog.show();
    }

    protected void dismissLoadingDialog() {
        if (loadingDialog != null)
            loadingDialog.dismiss();
    }

    protected void hideSoft() {
        ((InputMethodManager) getSystemService(INPUT_METHOD_SERVICE))
                .hideSoftInputFromWindow(BaseActivity.this.getCurrentFocus()
                        .getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
    }

    public boolean isStatusBarTranslucent() {
        return true;
    }


    public void did4ActivityBindDevice(GizWifiErrorCode error, String errorMessage,
                                       String did) {
    }

    public void did4ActivityChangeUserEmail(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityChangeUserInfo(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityChangeUserPassword(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityChangeUserPhone(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityDiscovered(GizWifiErrorCode error,
                                       List<GizWifiDevice> devicesList) {
    }

    public void did4ActivityGetCaptchaCode(GizWifiErrorCode result, String errorMessage,
                                           String token, String captchaId, String captchaURL) {
    }

    public void did4ActivityGetGroups(GizWifiErrorCode error, List<XPGWifiGroup> groupList) {
    }

    public void did4ActivityGetSSIDList(GizWifiErrorCode error,
                                        List<XPGWifiSSID> ssidInfoList) {
    }

    public void did4ActivityGetUserInfo(GizWifiErrorCode error, String errorMessage,
                                        GizUserInfo userInfo) {
    }

    public void did4ActivityRegisterUser(GizWifiErrorCode error, String errorMessage,
                                         String uid, String token) {
    }

    public void did4ActivityRequestSendPhoneSMSCode(GizWifiErrorCode result,
                                                    String errorMessage) {
    }

    public void did4ActivityRequestSendVerifyCode(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivitySetDeviceWifi(GizWifiErrorCode error, String mac, String did, String productKey) {
    }

    public void did4ActivityTransUser(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityUnbindDevice(GizWifiErrorCode error, String errorMessage,
                                         String did4Activity) {
    }

    public void did4ActivityUpdateProduct(GizWifiErrorCode error, String productKey) {
    }

    public void did4ActivityUserLogin(GizWifiErrorCode error, String errorMessage,
                                      String uid, String token) {
    }

    public void did4ActivityUserLogout(GizWifiErrorCode error, String errorMessage) {
    }

    public void did4ActivityVerifyPhoneSMSCode(GizWifiErrorCode result, String errorMessage) {
    }

    public void did4ActivitySetCustomInfo() {

    }

    public void didUpdateNetStatus(GizWifiDevice device, GizWifiDeviceNetStatus netStatus) {

    }

    public void didReceiveData(GizWifiDevice device, DeviceStatus deviceStatus) {

    }

    public void didSetCustomInfo(GizWifiErrorCode result, GizWifiDevice device) {

    }


    public void didUpdateSchedulers(GizWifiErrorCode result, GizWifiDevice schedulerOwner, List<GizDeviceScheduler> schedulerList) {

    }


    public void did4ActivityGetBindingUsers(GizWifiErrorCode result, String deviceID, List<GizUserInfo> bindUsers) {
    }

    public void did4ActivityUnbindUser(GizWifiErrorCode result, String deviceID, String guestUID) {
    }

    public void did4ActivityGetDeviceSharingInfos(GizWifiErrorCode result, String deviceID, List<GizDeviceSharingInfo> deviceSharingInfos) {
    }

    public void did4ActivitySharingDevice(GizWifiErrorCode result, String deviceID, int sharingID, Bitmap QRCodeImage) {
    }

    public void did4ActivityRevokeDeviceSharing(GizWifiErrorCode result, int sharingID) {
    }

    public void did4ActivityAcceptDeviceSharing(GizWifiErrorCode result, int sharingID) {
    }

    public void did4ActivityCheckDeviceSharingInfoByQRCode(GizWifiErrorCode result, String userName, String productName, String deviceAlias, String expiredAt) {
    }

    public void did4ActivityAcceptDeviceSharingByQRCode(GizWifiErrorCode result) {
    }

    public void did4ActivityModifySharingInfo(GizWifiErrorCode result, int sharingID) {
    }

    public void did4ActivityQueryMessageList(GizWifiErrorCode result, List<GizMessage> messageList) {
    }

    public void did4ActivityMarkMessageStatus(GizWifiErrorCode result, String messageID) {
    }
}
