package ${packageName}.widget;


import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

public class NoPaddingTextView extends TextView {
    Paint.FontMetricsInt fontMetricsInt;
    Bitmap bmp;
    public NoPaddingTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setIncludeFontPadding(false);
        Typeface typeface= Typeface.createFromAsset(context.getAssets(),"HelveticaNeueLTStd-Th.otf");
        this.setTypeface(typeface);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (fontMetricsInt == null){
            fontMetricsInt = new Paint.FontMetricsInt();
            getPaint().getFontMetricsInt(fontMetricsInt);
        }
        setMeasuredDimension(getMeasuredWidth(),(int)getPaint().getTextSize()-fontMetricsInt.bottom);

    }



}