package ${packageName}.utils;

import android.text.TextUtils;

import com.gizwits.gizwifisdk.api.GizWifiDevice;
import com.gizwits.gizwifisdk.enumration.GizWifiDeviceNetStatus;
import ${packageName}.Constant;
import com.mai.xmai_fast_lib.utils.MLog;

import org.json.JSONException;
import org.json.JSONObject;


/**
 * Created by mai on 17/4/9.
 */

public class CommonUtils {

    public static String getDeviceName(GizWifiDevice device) {
        return TextUtils.isEmpty(device.getAlias()) ? device.getProductName() : device.getAlias();

    }

    public static boolean isOnline(GizWifiDevice device) {
        if (device.getNetStatus() == GizWifiDeviceNetStatus.GizDeviceControlled || device.getNetStatus() == GizWifiDeviceNetStatus.GizDeviceOnline) {
            MLog.log("设备在线");
            return true;
        }
        MLog.log("设备不在线");
        return false;
    }

    public static String getOnlineStatus(GizWifiDevice device) {
        if (isOnline(device)) {
            return "{\"isOnline\":1}";
        }
        return "{\"isOnline\":0}";
    }

    public static String getAPPInfo() {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("app_id", Constant.APP_ID);
            jsonObject.put("app_secret", Constant.APP_SECRET);
            jsonObject.put("product_key", Constant.PRODUCT_KEY);
            jsonObject.put("product_secret", Constant.PRODUCT_SECRET);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }
}
