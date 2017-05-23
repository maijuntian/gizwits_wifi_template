package ${packageName}.utils;

import android.content.Context;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import ${packageName}.R;
import ${packageName}.activity.ForgetPwd2Activity;

/**
 * Created by mai on 17/4/20.
 */

public class MToast {

    private Toast mToast;

    private MToast(Context context, CharSequence text, int duration) {
        View v = LayoutInflater.from(context).inflate(R.layout.view_toast, null);
        TextView textView = (TextView) v.findViewById(R.id.tv_msg);
        textView.setText(text);
        mToast = new Toast(context);
        mToast.setDuration(duration);
        mToast.setGravity(Gravity.FILL_HORIZONTAL | Gravity.CENTER, 0, 0);
        mToast.setView(v);
    }

    public static MToast makeText(Context context, CharSequence text, int duration) {
        return new MToast(context, text, duration);
    }

    public void show() {
        if (mToast != null) {
            mToast.show();
        }
    }


}