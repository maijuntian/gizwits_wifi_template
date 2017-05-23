package ${packageName}.widget;

import android.os.CountDownTimer;
import android.widget.TextView;

import ${packageName}.R;


public class TextViewTimeCount extends CountDownTimer {

    TextView tView;

    /**
     * 按钮计时器
     *
     * @param millisInFuture 计时时长 单位毫秒
     * @param tView
     */
    public TextViewTimeCount(long millisInFuture, TextView tView) {
        super(millisInFuture, 1000);//millisInFuture, countDownInterval
        this.tView = tView;
    }

    @Override
    public void onTick(long millisUntilFinished) {
        tView.setEnabled(false);
        tView.getLayoutParams().width = tView.getMeasuredWidth();
        tView.setText(millisUntilFinished / 1000 + tView.getResources().getString(R.string.resend_verification_code));
        tView.setTextColor(tView.getResources().getColor(R.color.text_xgray));
        tView.setBackgroundDrawable(tView.getResources().getDrawable(R.drawable.all_circle_trans_gray));
    }

    @Override
    public void onFinish() {
        tView.setText(R.string.send_verification_code);
        tView.setEnabled(true);
        tView.setTextColor(tView.getResources().getColor(R.color.orange));
        tView.setBackgroundDrawable(tView.getResources().getDrawable(R.drawable.all_circle_trans_orange));
    }
}
