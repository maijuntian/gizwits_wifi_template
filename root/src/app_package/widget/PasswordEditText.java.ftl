package ${packageName}.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.text.method.HideReturnsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.EditText;

import ${packageName}.R;
import com.mai.xmai_fast_lib.utils.DisplayUtils;

public class PasswordEditText extends EditText {

    private boolean isCheck = true;

    public PasswordEditText(Context context) {
        super(context);
        init();
    }

    public PasswordEditText(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    public PasswordEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        init();
    }

    private void init() {
        setTransformationMethod(PasswordTransformationMethod.getInstance());
        switchStatus();
    }

    //切换状态
    private void switchStatus() {
        if (isCheck) {
            isCheck = false;
            setTransformationMethod(PasswordTransformationMethod.getInstance());
            setCompoundDrawablesWithIntrinsicBounds(R.mipmap.login_ic_password, 0, R.mipmap.see_nor, 0);
        } else {
            isCheck = true;
            setTransformationMethod(HideReturnsTransformationMethod.getInstance());
            setCompoundDrawablesWithIntrinsicBounds(R.mipmap.login_ic_password, 0, R.mipmap.see_sel, 0);
        }
    }

    // 处理删除事件
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_UP) {
            int eventX = (int) event.getRawX();
            int eventY = (int) event.getRawY();
            Rect rect = new Rect();
            getGlobalVisibleRect(rect);
            rect.left = (int) (rect.right - DisplayUtils.dip2px(getContext(), 40));
            if (rect.contains(eventX, eventY)) {
                switchStatus();
            }
        }
        return super.onTouchEvent(event);
    }

}
