package ${packageName}.utils;

import android.app.Activity;
import android.app.Dialog;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import ${packageName}.R;

import butterknife.ButterKnife;
import rx.functions.Action0;
import rx.functions.Action1;

public class DialogUtils {

    public static void showDialog(final Activity act, final String msg, final Action0 callBack) {
        final Dialog dialog = new Dialog(act, R.style.LoadingDialog);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.dialog_confirm);
        TextView tvKnow = ButterKnife.findById(dialog, R.id.tv_know);
        TextView tvContent = ButterKnife.findById(dialog, R.id.tv_content);
        tvContent.setText(msg);
        tvKnow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                if (callBack != null)
                    callBack.call();
            }
        });
        dialog.show();
    }

    public static void showSelectDialog(final Activity act, final String msg, int topResId, final Action0 callBack) {
        final Dialog dialog = new Dialog(act, R.style.LoadingDialog);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.dialog_select);
        TextView tvConfirm = ButterKnife.findById(dialog, R.id.tv_confirm);
        TextView tvContent = ButterKnife.findById(dialog, R.id.tv_content);
        tvContent.setText(msg);
        tvContent.setCompoundDrawablesWithIntrinsicBounds(0, topResId, 0, 0);
        tvConfirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                if (callBack != null)
                    callBack.call();
            }
        });
        ButterKnife.findById(dialog, R.id.tv_cancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    public static void showNoWifiDialog(final Activity act) {
        final Dialog dialog = new Dialog(act, R.style.LoadingDialog);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.dialog_no_wifi);
        TextView tvKnow = ButterKnife.findById(dialog, R.id.tv_know);
        tvKnow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    public static void showUpdateNameDialog(final Activity act, final String content, final Action1<String> callBack) {
        final Dialog dialog = new Dialog(act, R.style.LoadingDialog);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.dialog_update_name);
        TextView tvConfirm = ButterKnife.findById(dialog, R.id.tv_confirm);
        final EditText et_name = ButterKnife.findById(dialog, R.id.et_name);
        et_name.setText(content);
        et_name.setSelection(et_name.length());
        tvConfirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (et_name.length() == 0) {
                    Toast.makeText(act, R.string.name_is_unnull, Toast.LENGTH_SHORT).show();
                    return;
                }
                dialog.dismiss();
                if (callBack != null)
                    callBack.call(et_name.getText().toString());
            }
        });
        ButterKnife.findById(dialog, R.id.tv_cancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.show();
    }
}
