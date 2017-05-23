package ${packageName}.utils;

import com.gizwits.gizwifisdk.enumration.GizWifiErrorCode;
import ${packageName}.MyApplication;
import ${packageName}.R;
import com.larksmart7618.sdk.communication.tools.commen.ToastTools;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by mai on 17/5/17.
 */

public class GIzErrorHelper {
    static Map<GizWifiErrorCode, String> error_code = new HashMap<>();

    private static String getString(int resId) {
        return MyApplication.getInstance().getString(resId);
    }

    static {
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_APPID_INVALID, getString(R.string.GIZ_OPENAPI_APPID_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_ATTR_INVALID, getString(R.string.GIZ_OPENAPI_ATTR_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_BAD_QRCODE_CONTENT, getString(R.string.GIZ_OPENAPI_BAD_QRCODE_CONTENT));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_BT_FIRMWARE_NOTHING_TO_UPGRADE, getString(R.string.GIZ_OPENAPI_BT_FIRMWARE_NOTHING_TO_UPGRADE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_BT_FIRMWARE_UNVERIFIED, getString(R.string.GIZ_OPENAPI_BT_FIRMWARE_UNVERIFIED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_CODE_EXPIRED, getString(R.string.GIZ_OPENAPI_CODE_EXPIRED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_CODE_INVALID, getString(R.string.GIZ_OPENAPI_CODE_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DATAPOINT_DATA_NOT_FOUND, getString(R.string.GIZ_OPENAPI_DATAPOINT_DATA_NOT_FOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DEPRECATED_API, getString(R.string.GIZ_OPENAPI_DEPRECATED_API));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DEVICE_DISABLED, getString(R.string.GIZ_OPENAPI_DEVICE_DISABLED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DEVICE_NOT_BOUND, getString(R.string.GIZ_OPENAPI_DEVICE_NOT_BOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DEVICE_NOT_FOUND, getString(R.string.GIZ_OPENAPI_DEVICE_NOT_FOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DEVICE_OFFLINE, getString(R.string.GIZ_OPENAPI_DEVICE_OFFLINE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_DID_PASSCODE_INVALID, getString(R.string.GIZ_OPENAPI_DID_PASSCODE_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_EMAIL_UNAVALIABLE, getString(R.string.GIZ_OPENAPI_EMAIL_UNAVALIABLE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_EVENT_NOT_DEFINED, getString(R.string.GIZ_OPENAPI_EVENT_NOT_DEFINED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_FAILED_NOTIFY_M2M, getString(R.string.GIZ_OPENAPI_FAILED_NOTIFY_M2M));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_FIRMWARE_NOT_FOUND, getString(R.string.GIZ_OPENAPI_FIRMWARE_NOT_FOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_FORM_INVALID, getString(R.string.GIZ_OPENAPI_FORM_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_JD_PRODUCT_NOT_FOUND, getString(R.string.GIZ_OPENAPI_JD_PRODUCT_NOT_FOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_M2M_ID_INVALID, getString(R.string.GIZ_OPENAPI_M2M_ID_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_MAC_ALREADY_REGISTERED, getString(R.string.GIZ_OPENAPI_MAC_ALREADY_REGISTERED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_NOT_ALLOWED_CALL_API, getString(R.string.GIZ_OPENAPI_NOT_ALLOWED_CALL_API));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_OTA_SERVICE_OK_BUT_IN_IDLE, getString(R.string.GIZ_OPENAPI_OTA_SERVICE_OK_BUT_IN_IDLE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_PHONE_UNAVALIABLE, getString(R.string.GIZ_OPENAPI_PHONE_UNAVALIABLE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_PRODUCTION_SCALE_QUOTA_EXHAUSTED, getString(R.string.GIZ_OPENAPI_PRODUCTION_SCALE_QUOTA_EXHAUSTED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_PRODUCT_HAS_NO_REQUEST_SCALE, getString(R.string.GIZ_OPENAPI_PRODUCT_HAS_NO_REQUEST_SCALE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_PRODUCT_KEY_INVALID, getString(R.string.GIZ_OPENAPI_PRODUCT_KEY_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_QQ_OAUTH_KEY_INVALID, getString(R.string.GIZ_OPENAPI_QQ_OAUTH_KEY_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_REQUEST_THROTTLED, getString(R.string.GIZ_OPENAPI_REQUEST_THROTTLED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_RESERVED, getString(R.string.GIZ_OPENAPI_RESERVED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SANDBOX_SCALE_QUOTA_EXHAUSTED, getString(R.string.GIZ_OPENAPI_SANDBOX_SCALE_QUOTA_EXHAUSTED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SAVE_KAIROSDB_ERROR, getString(R.string.GIZ_OPENAPI_SAVE_KAIROSDB_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SCHEDULER_NOT_FOUND, getString(R.string.GIZ_OPENAPI_SCHEDULER_NOT_FOUND));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SEND_COMMAND_FAILED, getString(R.string.GIZ_OPENAPI_SEND_COMMAND_FAILED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SEND_SMS_FAILED, getString(R.string.GIZ_OPENAPI_SEND_SMS_FAILED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SERVER_ERROR, getString(R.string.GIZ_OPENAPI_SERVER_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_SIGNATURE_INVALID, getString(R.string.GIZ_OPENAPI_SIGNATURE_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_TIMESTAMP_INVALID, getString(R.string.GIZ_OPENAPI_TIMESTAMP_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_TOKEN_EXPIRED, getString(R.string.GIZ_OPENAPI_TOKEN_EXPIRED));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_TOKEN_INVALID, getString(R.string.GIZ_OPENAPI_TOKEN_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_USERNAME_PASSWORD_ERROR, getString(R.string.GIZ_OPENAPI_USERNAME_PASSWORD_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_USERNAME_UNAVALIABLE, getString(R.string.GIZ_OPENAPI_USERNAME_UNAVALIABLE));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_USER_INVALID, getString(R.string.GIZ_OPENAPI_USER_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_OPENAPI_USER_NOT_EXIST, getString(R.string.GIZ_OPENAPI_USER_NOT_EXIST));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_APPID_OR_TOKEN_ERROR, getString(R.string.GIZ_PUSHAPI_APPID_OR_TOKEN_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_APPKEY_SECRETKEY_INVALID, getString(R.string.GIZ_PUSHAPI_APPKEY_SECRETKEY_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_AUTH_KEY_INVALID, getString(R.string.GIZ_PUSHAPI_AUTH_KEY_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_BODY_JSON_INVALID, getString(R.string.GIZ_PUSHAPI_BODY_JSON_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_CHANNELID_ERROR_INVALID, getString(R.string.GIZ_PUSHAPI_CHANNELID_ERROR_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_DATA_NOT_EXIST, getString(R.string.GIZ_PUSHAPI_DATA_NOT_EXIST));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_GIZWITS_APPID_EXIST, getString(R.string.GIZ_PUSHAPI_GIZWITS_APPID_EXIST));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_ID_PARAM_ERROR, getString(R.string.GIZ_PUSHAPI_ID_PARAM_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_NO_CLIENT_CONFIG, getString(R.string.GIZ_PUSHAPI_NO_CLIENT_CONFIG));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_NO_SERVER_DATA, getString(R.string.GIZ_PUSHAPI_NO_SERVER_DATA));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_PARAM_ERROR, getString(R.string.GIZ_PUSHAPI_PARAM_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_PUSH_ERROR, getString(R.string.GIZ_PUSHAPI_PUSH_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_PUSHAPI_TYPE_PARAM_ERROR, getString(R.string.GIZ_PUSHAPI_TYPE_PARAM_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_SDK_APK_CONTEXT_IS_NULL, getString(R.string.GIZ_SDK_APK_CONTEXT_IS_NULL));
        error_code.put(GizWifiErrorCode.GIZ_SDK_APK_PERMISSION_NOT_SET, getString(R.string.GIZ_SDK_APK_PERMISSION_NOT_SET));
        error_code.put(GizWifiErrorCode.GIZ_SDK_APPID_IS_EMPTY, getString(R.string.GIZ_SDK_APPID_IS_EMPTY));
        error_code.put(GizWifiErrorCode.GIZ_SDK_APPID_LENGTH_ERROR, getString(R.string.GIZ_SDK_APPID_LENGTH_ERROR));
        error_code.put(GizWifiErrorCode.GIZ_SDK_USER_ID_INVALID, getString(R.string.GIZ_SDK_USER_ID_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_SDK_TOKEN_INVALID, getString(R.string.GIZ_SDK_TOKEN_INVALID));
        error_code.put(GizWifiErrorCode.GIZ_SDK_PARAM_INVALID, getString(R.string.GIZ_SDK_PARAM_INVALID));
    }

    public static String getError(GizWifiErrorCode errorCode) {
        return error_code.get(errorCode);
    }

    public static void showError(GizWifiErrorCode errorCode) {
        if (errorCode != GizWifiErrorCode.GIZ_SDK_SUCCESS) {
            ToastTools.short_Toast(MyApplication.getInstance().getApplicationContext(), getError(errorCode));
        }
    }
}
