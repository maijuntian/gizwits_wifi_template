package ${packageName}.utils;

import ${packageName}.MyApplication;
import com.mai.xmai_fast_lib.utils.MLog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by mai on 16/11/29.
 */
public class CmdUtils {
    private final int DEFAULT_SN = 0;
    private final List<String> mParamsNames = new ArrayList<>();
    private final List<Object> mParamsValues = new ArrayList<>();

    public int size() {
        if (mParamsNames != null) {
            return mParamsNames.size();
        }
        return 0;
    }

    private String name(int index) {
        return mParamsNames.get(index);
    }

    private Object value(int index) {
        return mParamsValues.get(index);
    }

    public CmdUtils add(String name, Object value) {
        mParamsNames.add(name);
        mParamsValues.add(value);
        return this;
    }

    public void write() {
        if (size() > 0) {
            ConcurrentHashMap<String, Object> mCommand = new ConcurrentHashMap<>();
            for (int i = 0, size = this.size(); i < size; i++) {
                mCommand.put(mParamsNames.get(i), mParamsValues.get(i));
            }
            MLog.log("发送命令：" + mCommand.toString());
            MyApplication.getInstance().getCurrDevice().write(mCommand, DEFAULT_SN);
        }
    }
}
