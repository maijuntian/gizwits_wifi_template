package ${packageName};

import android.app.Activity;
import android.graphics.Bitmap;

import com.gizwits.gizwifisdk.api.GizDeviceScheduler;
import com.gizwits.gizwifisdk.api.GizDeviceSchedulerCenter;
import com.gizwits.gizwifisdk.api.GizDeviceSharing;
import com.gizwits.gizwifisdk.api.GizDeviceSharingInfo;
import com.gizwits.gizwifisdk.api.GizMessage;
import com.gizwits.gizwifisdk.api.GizUserInfo;
import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.api.GizWifiGroup;
import com.gizwits.gizwifisdk.api.GizWifiSDK;
import com.gizwits.gizwifisdk.api.GizWifiSSID;
import com.gizwits.gizwifisdk.enumration.GizEventType;
import com.gizwits.gizwifisdk.enumration.GizWifiDeviceNetStatus;
import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import com.gizwits.gizwifisdk.listener.GizDeviceSchedulerCenterListener;
import com.gizwits.gizwifisdk.listener.GizDeviceSharingListener;
import com.gizwits.gizwifisdk.listener.GizWifiDeviceListener;
import com.gizwits.gizwifisdk.listener.GizWifiSDKListener;
import ${packageName}.base.BaseActivity;
import ${packageName}.bean.DeviceStatus;
import ${packageName}.bean.User;
import ${packageName}.utils.Keys;
import com.mai.xmai_fast_lib.base.BaseApplication;
import com.mai.xmai_fast_lib.utils.MLog;
import com.mai.xmai_fast_lib.utils.SharedPreferencesHelper;
import com.mai.xmai_fast_lib.utils.XAppManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by mai on 16/10/14.
 */
public class MyApplication extends BaseApplication {

    private static MyApplication instance;

    public static MyApplication getInstance() {
        return instance;
    }

    private List<GizWifiDevice> bindDevices = new ArrayList<>();
    private List<GizWifiDevice> unBindDevices = new ArrayList<>();

    private Map<String, DeviceStatus> deviceStatusMap = new HashMap<>();

    private GizWifiDevice currDevice;

    public User currUser;


    @Override
    /**** bugly ****/
    public String getBuglyAppid() {
        return "${Bugly_AppId}";
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        XDBManager.initDataBase(getApplicationContext());

//        initGizwit();
    }

    public DeviceStatus getDeviceStatus(String did) {
        return deviceStatusMap.get(did);
    }

    public User getCurrUser() {
        if (currUser == null) {
            List<User> users = XDBManager.getUserDao().loadAll();
            if (users != null && users.size() > 0)
                currUser = users.get(0);
        }
        return currUser;
    }

    public List<GizWifiDevice> getBindDevices() {
        return bindDevices;
    }

    public List<GizWifiDevice> getUnBindDevices() {
        return unBindDevices;
    }

    public void setCurrDevice(int position) {
        this.currDevice = bindDevices.get(position);
    }

    public void setCurrDevice(GizWifiDevice currDevice) {
        this.currDevice = currDevice;
    }

    public GizWifiDevice getCurrDevice() {
        return currDevice;
    }

    public DeviceStatus getCurrStatus() {
        return deviceStatusMap.get(getCurrDevice().getDid());
    }

    public void setCurrUser(User currUser) {
        this.currUser = currUser;
    }

    public void initGizwitToken() {
        if (getCurrUser() != null) {
            MLog.log("phone:" + currUser.getPhone() + "   password:" + currUser.getPassword());
            GizWifiSDK.sharedInstance().userLogin(currUser.getPhone(), currUser.getPassword());
        }
    }

    public GizWifiDevice findDeviceMac(String mac) {
        for (GizWifiDevice gizWifiDevice : bindDevices) {
            if (gizWifiDevice.getMacAddress().equals(mac)) {
                return gizWifiDevice;
            }
        }
        return null;
    }

    public GizWifiDevice findDeviceByDid(String did) {
        for (GizWifiDevice gizWifiDevice : bindDevices) {
            MLog.log("查找did:" + did + "   " + gizWifiDevice.getDid());
            if (gizWifiDevice.getDid().equals(did)) {
                return gizWifiDevice;
            }
        }
        return null;
    }

    /******************** 机智云 **********************/
    public void initGizwit() {
        GizWifiSDK.sharedInstance().setListener(sdkListener);

        List<String> pks = new ArrayList<>();
        pks.add(Constant.PRODUCT_KEY);
        GizWifiSDK.sharedInstance().startWithAppID(getApplicationContext(), Constant.APP_ID, Constant.APP_SECRET, pks, null, false);

        GizDeviceSchedulerCenter.setListener(gizDeviceSchedulerCenterListener);
        GizDeviceSharing.setListener(mSharingListener);
    }

    GizDeviceSchedulerCenterListener gizDeviceSchedulerCenterListener = new GizDeviceSchedulerCenterListener() {

        @Override
        public void didUpdateSchedulers(GizWifiErrorCode result, GizWifiDevice schedulerOwner, List<GizDeviceScheduler> schedulerList) {
            if (schedulerList != null) {
                for (GizDeviceScheduler scheduler : schedulerList) {
                    MLog.log("定时列表：--->" + scheduler.toString() + "   " + scheduler.getAttrs().toString());
                }
            }

            didUpdateSchedulers2(result, schedulerOwner, schedulerList);
        }
    };

    GizDeviceSharingListener mSharingListener = new GizDeviceSharingListener(){
        @Override
        public void didGetBindingUsers(GizWifiErrorCode result, String deviceID, List<GizUserInfo> bindUsers) {
            MLog.log("获取绑定用户列表---->" + result);
            did4ActivityGetBindingUsers(result, deviceID, bindUsers);
        }

        @Override
        public void didUnbindUser(GizWifiErrorCode result, String deviceID, String guestUID) {
            MLog.log("解绑结果---->" + result);
            did4ActivityUnbindUser(result, deviceID, guestUID);
        }

        @Override
        public void didGetDeviceSharingInfos(GizWifiErrorCode result, String deviceID, List<GizDeviceSharingInfo> deviceSharingInfos) {
            did4ActivityGetDeviceSharingInfos(result, deviceID, deviceSharingInfos);
        }

        @Override
        public void didSharingDevice(GizWifiErrorCode result, String deviceID, int sharingID, Bitmap QRCodeImage) {
            MLog.log("获取分享设备二维码---->" + result);
            did4ActivitySharingDevice(result, deviceID, sharingID, QRCodeImage);
        }

        @Override
        public void didRevokeDeviceSharing(GizWifiErrorCode result, int sharingID) {
            did4ActivityRevokeDeviceSharing(result, sharingID);
        }

        @Override
        public void didAcceptDeviceSharing(GizWifiErrorCode result, int sharingID) {
            did4ActivityAcceptDeviceSharing(result, sharingID);
        }

        @Override
        public void didCheckDeviceSharingInfoByQRCode(GizWifiErrorCode result, String userName, String productName, String deviceAlias, String expiredAt) {
            did4ActivityCheckDeviceSharingInfoByQRCode(result, userName, productName, deviceAlias, expiredAt);
        }

        @Override
        public void didAcceptDeviceSharingByQRCode(GizWifiErrorCode result) {
            MLog.log("接收二维码分享设备---->" + result);
            did4ActivityAcceptDeviceSharingByQRCode(result);
        }

        @Override
        public void didModifySharingInfo(GizWifiErrorCode result, int sharingID) {
            did4ActivityModifySharingInfo(result, sharingID);
        }

        @Override
        public void didQueryMessageList(GizWifiErrorCode result, List<GizMessage> messageList) {
            did4ActivityQueryMessageList(result, messageList);
        }

        @Override
        public void didMarkMessageStatus(GizWifiErrorCode result, String messageID) {
            did4ActivityMarkMessageStatus(result, messageID);
        }
    };

    GizWifiDeviceListener mDeviceListener = new GizWifiDeviceListener() {

        @Override
        public void didUpdateNetStatus(GizWifiDevice device, GizWifiDeviceNetStatus netStatus) {
            super.didUpdateNetStatus(device, netStatus);
            didUpdateNetStatus2(device, netStatus);
        }

        @Override
        public void didSetSubscribe(final GizWifiErrorCode result, GizWifiDevice device, final boolean isSubscribed) {
            super.didSetSubscribe(result, device, isSubscribed);
            if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS) {
                MLog.log("订阅或解除订阅成功：" + isSubscribed);
                // 订阅或解除订阅成功
            } else {
                MLog.log("订阅或解除订阅失败：" + isSubscribed);
            }
        }

        @Override
        public void didReceiveData(final GizWifiErrorCode result, GizWifiDevice device, final ConcurrentHashMap<String, Object> dataMap, int sn) {
            super.didReceiveData(result, device, dataMap, sn);
            MLog.log("获取设备状态-->：" + result.getResult());
            if (result == GizWifiErrorCode.GIZ_SDK_SUCCESS && dataMap.get("data") != null) {
                DeviceStatus status = deviceStatusMap.get(device.getDid());
                if (status == null) {
                    status = new DeviceStatus();
                }
                status.parseStatus(dataMap);
                deviceStatusMap.put(device.getDid(), status);
                didReceiveData2(device, status);
            }
        }

        @Override
        public void didSetCustomInfo(GizWifiErrorCode result, GizWifiDevice device) {
            super.didSetCustomInfo(result, device);
            didSetCustomInfo2(result, device);
        }

    };

    public GizWifiSDKListener sdkListener = new GizWifiSDKListener() {

        @Override
        public void didNotifyEvent(GizEventType eventType, Object eventSource, GizWifiErrorCode eventID, String eventMessage) {
            if (eventType == GizEventType.GizEventSDK) {
                // SDK的事件通知
                MLog.log("GizWifiSDK", "SDK event happened: " + eventID + ", " + eventMessage);
                initGizwitToken();
            } else if (eventType == GizEventType.GizEventDevice) {
                // 设备连接断开时可能产生的通知
                GizWifiDevice mDevice = (GizWifiDevice) eventSource;
                MLog.log("GizWifiSDK", "device mac: " + mDevice.getMacAddress() + " disconnect caused by eventID: " + eventID + ", eventMessage: " + eventMessage);
            } else if (eventType == GizEventType.GizEventM2MService) {
                // M2M服务返回的异常通知
                MLog.log("GizWifiSDK", "M2M domain " + (String) eventSource + " exception happened, eventID: " + eventID + ", eventMessage: " + eventMessage);
            } else if (eventType == GizEventType.GizEventToken) {
                // token失效通知
                MLog.log("GizWifiSDK", "token " + (String) eventSource + " expired: " + eventMessage);
            }
            super.didNotifyEvent(eventType, eventSource, eventID, eventMessage);
        }

        @Override
        public void didSetDeviceOnboarding(GizWifiErrorCode result, String mac, String did, String productKey) {
            super.didSetDeviceOnboarding(result, mac, did, productKey);
            MLog.log("配置设备", "code:" + result.getResult() + " mac:" + mac + " did:" + did + " productkey:" + productKey);
            did4ActivitySetDeviceWifi(result, mac, did, productKey);
        }

        @Override
        public void didGetSSIDList(GizWifiErrorCode result, List<GizWifiSSID> ssidInfoList) {
            super.didGetSSIDList(result, ssidInfoList);
        }

        @Override
        public void didDiscovered(GizWifiErrorCode result, List<GizWifiDevice> deviceList) {
            super.didDiscovered(result, deviceList);

            String mac = SharedPreferencesHelper.getInstance(getApplicationContext()).getStringValue(Keys.DEVICE_CHECK);
            boolean hasCheck = false;

            bindDevices.clear();
            unBindDevices.clear();
            for (int i = 0; i < deviceList.size(); i++) {
                GizWifiDevice device = deviceList.get(i);
                MLog.log("搜索设备", device.getProductName() + " " + device.getMacAddress() + " " + device.isBind() + " " + device.getNetStatus());

                if (device.getProductKey().equals(Constant.PRODUCT_KEY)) {
                    if (device.isBind()) {
                        if (!device.isSubscribed()) {
                            device.setListener(mDeviceListener);
                            device.setSubscribe(true);
                        }
                        if (device.getMacAddress().equals(mac) && !hasCheck) {
                            hasCheck = true;
                            currDevice = device;
                        }
                        bindDevices.add(device);
                    } else {
                        unBindDevices.add(device);
                    }
                }
            }
            if (bindDevices.size() > 0) {
                if (!hasCheck) {//没选中或者是选中的设备不存在，默认选中第一个
                    currDevice = bindDevices.get(0);
                    SharedPreferencesHelper.getInstance(getApplicationContext()).putStringValue(Keys.DEVICE_CHECK, currDevice.getMacAddress());
                }
            } else {
                currDevice = null;
//                SharedPreferencesHelper.getInstance(getApplicationContext()).putStringValue(Keys.DEVICE_CHECK, "");
            }
            did4ActivityDiscovered(result, deviceList);
        }

        @Override
        public void didUpdateProduct(GizWifiErrorCode result, String productKey, String productUI) {
            super.didUpdateProduct(result, productKey, productUI);
        }

        @Override
        public void didBindDevice(GizWifiErrorCode result, String did) {
            super.didBindDevice(result, did);
            MLog.log("绑定设备", "result:" + result.name() + " did:" + did);
            did4ActivityBindDevice(result, result.toString(), did);
        }

        @Override
        public void didUnbindDevice(GizWifiErrorCode result, String did) {
            super.didUnbindDevice(result, did);
            MLog.log("解绑设备", "result:" + result.name() + " did:" + did);
            did4ActivityUnbindDevice(result, result.name(), did);
        }

        @Override
        public void didGetCaptchaCode(GizWifiErrorCode result, String token, String captchaId, String captchaURL) {
            super.didGetCaptchaCode(result, token, captchaId, captchaURL);
            MLog.log("获取图片验证码", "result:" + result.getResult() + " token:" + token + " catchaId:" + captchaId);
            did4ActivityGetCaptchaCode(result, result.toString(), token, captchaId, captchaURL);
        }

        @Override
        public void didRequestSendPhoneSMSCode(GizWifiErrorCode result, String token) {
            super.didRequestSendPhoneSMSCode(result, token);
            MLog.log("获取手机验证码", "result:" + result.getResult() + " token:" + token);
            did4ActivityRequestSendPhoneSMSCode(result, result.toString());
        }

        @Override
        public void didVerifyPhoneSMSCode(GizWifiErrorCode result) {
            super.didVerifyPhoneSMSCode(result);
        }

        @Override
        public void didRegisterUser(GizWifiErrorCode result, String uid, String token) {
            super.didRegisterUser(result, uid, token);
            MLog.log("注册", "result:" + result.name() + " uid:" + uid + " token:" + token);
            did4ActivityRegisterUser(result, result.toString(), uid, token);

        }

        @Override
        public void didUserLogin(GizWifiErrorCode result, String uid, String token) {
            super.didUserLogin(result, uid, token);
            MLog.log("用户登录", "result:" + result.getResult() + " uid:" + uid + " token:" + token);
            did4ActivityUserLogin(result, result.toString(), uid, token);
        }

        @Override
        public void didChangeUserPassword(GizWifiErrorCode result) {
            super.didChangeUserPassword(result);
            did4ActivityChangeUserPassword(result, result.name());
        }

        @Override
        public void didChangeUserInfo(GizWifiErrorCode result) {
            super.didChangeUserInfo(result);
            did4ActivityChangeUserInfo(result, result.name());

        }

        @Override
        public void didTransAnonymousUser(GizWifiErrorCode result) {
            super.didTransAnonymousUser(result);
        }

        @Override
        public void didGetGroups(GizWifiErrorCode result, List<GizWifiGroup> groupList) {
            super.didGetGroups(result, groupList);
        }

        @Override
        public void didGetCurrentCloudService(GizWifiErrorCode result, ConcurrentHashMap<String, String> cloudServiceInfo) {
            super.didGetCurrentCloudService(result, cloudServiceInfo);
        }

        @Override
        public void didGetUserInfo(GizWifiErrorCode result, GizUserInfo userInfo) {
            super.didGetUserInfo(result, userInfo);
            did4ActivityGetUserInfo(result, result.name(), userInfo);

        }

        @Override
        public void didDisableLAN(GizWifiErrorCode result) {
            super.didDisableLAN(result);
        }

        @Override
        public void didChannelIDBind(GizWifiErrorCode result) {
            super.didChannelIDBind(result);
        }

        @Override
        public void didChannelIDUnBind(GizWifiErrorCode result) {
            super.didChannelIDUnBind(result);
        }
    };

    public void did4ActivityBindDevice(GizWifiErrorCode error, String errorMessage,
                                       String did) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityBindDevice(error, errorMessage, did);
            }
        }
    }


    public void did4ActivityChangeUserInfo(GizWifiErrorCode error, String errorMessage) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityChangeUserInfo(error, errorMessage);
            }
        }
    }

    public void did4ActivityChangeUserPassword(GizWifiErrorCode error, String errorMessage) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityChangeUserPassword(error, errorMessage);
            }
        }
    }

    public void did4ActivityDiscovered(GizWifiErrorCode error,
                                       List<GizWifiDevice> devicesList) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityDiscovered(error, devicesList);
            }
        }
    }

    public void did4ActivityGetCaptchaCode(GizWifiErrorCode result, String errorMessage,
                                           String token, String captchaId, String captchaURL) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityGetCaptchaCode(result, errorMessage, token, captchaId, captchaURL);
            }
        }
    }


    public void did4ActivityGetUserInfo(GizWifiErrorCode error, String errorMessage,
                                        GizUserInfo userInfo) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityGetUserInfo(error, errorMessage, userInfo);
            }
        }
    }

    public void did4ActivityRegisterUser(GizWifiErrorCode error, String errorMessage,
                                         String uid, String token) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityRegisterUser(error, errorMessage, uid, token);
            }
        }
    }

    public void did4ActivityRequestSendPhoneSMSCode(GizWifiErrorCode result,
                                                    String errorMessage) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityRequestSendPhoneSMSCode(result, errorMessage);
            }
        }
    }


    public void did4ActivitySetDeviceWifi(GizWifiErrorCode error, String mac, String did, String productKey) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivitySetDeviceWifi(error, mac, did, productKey);
            }
        }
    }


    public void did4ActivityUnbindDevice(GizWifiErrorCode error, String errorMessage,
                                         String did4Activity) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityUnbindDevice(error, errorMessage, did4Activity);
            }
        }
    }


    public void did4ActivityUserLogin(GizWifiErrorCode error, String errorMessage,
                                      String uid, String token) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityUserLogin(error, errorMessage, uid, token);
            }
        }

        if (getCurrUser() != null && token != null) {
            MLog.log("获取到token:" + token);
            currUser.setToken(token);
            currUser.setUid(uid);
            XDBManager.getUserDao().insertOrReplace(currUser);
        }
    }

    public void didUpdateNetStatus2(GizWifiDevice device, GizWifiDeviceNetStatus netStatus) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.didUpdateNetStatus(device, netStatus);
            }
        }
    }

    public void didReceiveData2(GizWifiDevice device, DeviceStatus deviceStatus) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.didReceiveData(device, deviceStatus);
            }
        }
    }

    public void didSetCustomInfo2(GizWifiErrorCode result, GizWifiDevice device) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.didSetCustomInfo(result, device);
            }
        }
    }

    public void didUpdateSchedulers2(GizWifiErrorCode result, GizWifiDevice schedulerOwner, List<GizDeviceScheduler> schedulerList) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.didUpdateSchedulers(result, schedulerOwner, schedulerList);
            }
        }
    }

    public void did4ActivityGetBindingUsers(GizWifiErrorCode result, String deviceID, List<GizUserInfo> bindUsers) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityGetBindingUsers(result, deviceID, bindUsers);
            }
        }
    }

    public void did4ActivityUnbindUser(GizWifiErrorCode result, String deviceID, String guestUID) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityUnbindUser(result, deviceID, guestUID);
            }
        }
    }

    public void did4ActivityGetDeviceSharingInfos(GizWifiErrorCode result, String deviceID, List<GizDeviceSharingInfo> deviceSharingInfos) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityGetDeviceSharingInfos(result, deviceID, deviceSharingInfos);
            }
        }
    }

    public void did4ActivitySharingDevice(GizWifiErrorCode result, String deviceID, int sharingID, Bitmap QRCodeImage) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivitySharingDevice(result, deviceID, sharingID, QRCodeImage);
            }
        }
    }

    public void did4ActivityRevokeDeviceSharing(GizWifiErrorCode result, int sharingID) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityRevokeDeviceSharing(result, sharingID);
            }
        }
    }

    public void did4ActivityAcceptDeviceSharing(GizWifiErrorCode result, int sharingID) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityAcceptDeviceSharing(result, sharingID);
            }
        }
    }

    public void did4ActivityCheckDeviceSharingInfoByQRCode(GizWifiErrorCode result, String userName, String productName, String deviceAlias, String expiredAt) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityCheckDeviceSharingInfoByQRCode(result, userName, productName, deviceAlias, expiredAt);
            }
        }
    }

    public void did4ActivityAcceptDeviceSharingByQRCode(GizWifiErrorCode result) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityAcceptDeviceSharingByQRCode(result);
            }
        }
    }

    public void did4ActivityModifySharingInfo(GizWifiErrorCode result, int sharingID) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityModifySharingInfo(result, sharingID);
            }
        }
    }

    public void did4ActivityQueryMessageList(GizWifiErrorCode result, List<GizMessage> messageList) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityQueryMessageList(result, messageList);
            }
        }
    }

    public void did4ActivityMarkMessageStatus(GizWifiErrorCode result, String messageID) {
        Stack<Activity> stack = XAppManager.getActivityStack();
        if (stack != null) {
            for (Activity activity : stack) {
                BaseActivity baseActivity = (BaseActivity) activity;
                baseActivity.did4ActivityMarkMessageStatus(result, messageID);
            }
        }
    }

    /*******************机智云**********************/

}
