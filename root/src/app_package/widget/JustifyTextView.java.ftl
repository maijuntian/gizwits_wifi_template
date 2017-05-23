package ${packageName}.widget;


import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.TextView;

import ${packageName}.R;


public class JustifyTextView extends TextView {
    private String text;
    private float textSize;

    private float marginLeft;

    private float marginRight;

    float lineSpacingExtra = 1.5f; //间隔

    private int textColor;

    private boolean isFirst = true;

    private Paint paint1 = new Paint();
    private float textShowWidth;

    public JustifyTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        text = attrs.getAttributeValue(
                "http://schemas.android.com/apk/res/android", "text");
        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.MaiTextView);
        textSize = typedArray.getDimension(R.styleable.MaiTextView_textSize, 24);
        textColor = typedArray.getColor(R.styleable.MaiTextView_textColor, Color.BLACK);
        marginLeft = typedArray.getDimension(R.styleable.MaiTextView_marginLeft, 0);
        marginRight = typedArray.getDimension(R.styleable.MaiTextView_marginRight, 0);

        paint1.setTextSize(textSize);
        paint1.setColor(textColor);
        paint1.setAntiAlias(true);
        textShowWidth = ((Activity) context).getWindowManager().getDefaultDisplay().getWidth() - marginLeft - marginRight;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        //super.onDraw(canvas);
        int lineCount = 0;
        text = this.getText().toString();//.replaceAll("\n", "\r\n");
        if (text == null) return;
        char[] textCharArray = text.toCharArray();
        // 已绘的宽度
        float drawedWidth = 0;
        float charWidth;
        for (int i = 0; i < textCharArray.length; i++) {
            charWidth = paint1.measureText(textCharArray, i, 1);

            if (textCharArray[i] == '\n') {
                lineCount++;
                drawedWidth = 0;
                continue;
            }
            if (textShowWidth - drawedWidth < charWidth) {
                lineCount++;
                drawedWidth = 0;
            }
            canvas.drawText(textCharArray, i, 1, drawedWidth,
                    (lineCount + 1) * textSize * lineSpacingExtra, paint1);
            drawedWidth += charWidth;
        }
        if (isFirst) {
            isFirst = false;
            setHeight((int) ((lineCount + 1) * textSize * lineSpacingExtra) + 5);
        }
    }
}