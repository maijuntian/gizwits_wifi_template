package ${packageName}.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;

import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import com.mai.xmai_fast_lib.utils.MLog;

/**
 * Created by Speed on 2016/1/11.
 */
public class GlideTopCornerTransform extends BitmapTransformation {

    private static float radius = 0f;

    public GlideTopCornerTransform(Context context, int dp) {
        super(context);
        this.radius = Resources.getSystem().getDisplayMetrics().density * dp;
    }

    protected Bitmap transform(BitmapPool pool, Bitmap toTransform, int outWidth, int outHeight) {
        return roundCrop(pool, toTransform);
    }

    private static Bitmap roundCrop(BitmapPool pool, Bitmap source) {
        if (source == null) return null;

        Bitmap result = pool.get(source.getWidth(), source.getHeight(), Bitmap.Config.ARGB_8888);
        if (result == null) {
            result = Bitmap.createBitmap(source.getWidth(), source.getHeight(), Bitmap.Config.ARGB_8888);
        }

        Canvas canvas = new Canvas(result);

        RoundRectShape rectShape = new RoundRectShape(new float[]{radius, radius, radius, radius, 0, 0, 0, 0}, null, null);
        ShapeDrawable mDrawables = new ShapeDrawable(rectShape);
        Paint paint = mDrawables.getPaint();
        paint.setShader(new BitmapShader(source, BitmapShader.TileMode.CLAMP, BitmapShader.TileMode.CLAMP));
        paint.setAntiAlias(true);
        Rect rect = new Rect(0, 0, source.getWidth(), source.getHeight());
        mDrawables.setBounds(rect);
        mDrawables.draw(canvas);

        return result;
    }

    @Override
    public String getId() {
        return getClass().getName();
    }
}