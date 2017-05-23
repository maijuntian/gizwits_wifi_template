package ${packageName}.service;

import android.content.Context;
import android.content.Intent;

import ${packageName}.MyApplication;
import ${packageName}.activity.LoginActivity;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;


/**
 * Created by mai on 17/2/6.
 */
public class UserService {

    public static boolean checkUser(Context context) {
        if (MyApplication.getInstance().getCurrUser() == null) {
            context.startActivity(new Intent(context, LoginActivity.class));
            return false;
        }
        return true;
    }

    public static boolean checkUser() {
        if (MyApplication.getInstance().getCurrUser() == null) {
            return false;
        }
        return true;
    }

    public static String getUserInfo() {
        try {
            JSONObject jsonObject = new JSONObject(new Gson().toJson(MyApplication.getInstance().getCurrUser()));
            jsonObject.put("id", MyApplication.getInstance().getCurrUser().getUid());
            return jsonObject.toString();
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return null;
    }

}
