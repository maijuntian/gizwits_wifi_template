package ${packageName}.widget;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

import ${packageName}.R;


/**
 * Created by mai on 16/8/4.
 */
public class LoadingDialog extends Dialog {
    private ImageView iv_loading;
    private Animation mAnimation;

    public LoadingDialog(Context context) {
        super(context, R.style.LoadingDialog);
        mAnimation = AnimationUtils.loadAnimation(context, R.anim.loading_rotate);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.dialog_loading);
        this.setCanceledOnTouchOutside(false);

        this.iv_loading = (ImageView) this.findViewById(R.id.iv_loading);
    }

    @Override
    public void show() {
        super.show();
        this.iv_loading.startAnimation(mAnimation);
    }

    @Override
    public void dismiss() {
        super.dismiss();
        this.iv_loading.clearAnimation();
    }


    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}
