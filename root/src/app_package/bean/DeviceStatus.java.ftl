package ${packageName}.bean;

import android.content.Context;
import android.util.Base64;

import ${packageName}.R;
import com.mai.xmai_fast_lib.utils.MLog;

import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by mai on 16/10/28.
 */
public class DeviceStatus {

    String statusJson;

    public String getStatusJson() {
        return statusJson;
    }

    public void parseStatus(ConcurrentHashMap<String, Object> dataMap) {
        MLog.log("解析状态");
        if (dataMap.get("data") != null) {
            Map<String, Object> data = (Map<String, Object>) dataMap.get("data");
            MLog.log("上报数据：" + data.toString());
            if (data.size() > 0) {
                JSONObject jsonObject = new JSONObject(data);
                statusJson = jsonObject.toString();


                /***解析状态***/

                /***解析状态***/

                MLog.log("设备状态：" + this.toString());
            }
        }
    }

}
