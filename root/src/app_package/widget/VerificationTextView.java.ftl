package ${packageName}.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/**
 * Created by mai on 17/4/18.
 */

public class VerificationTextView extends TextView{

    TextViewTimeCount timeCount;

    public VerificationTextView(Context context) {
        super(context);
    }

    public VerificationTextView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public VerificationTextView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();

        timeCount = new TextViewTimeCount(60000, this);

    }


    public void startCountDown(){
        timeCount.start();
    }


    public void stopCountDown(){
        timeCount.cancel();
    }
}
