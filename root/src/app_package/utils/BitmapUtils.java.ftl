package ${packageName}.utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.view.View;

import ${packageName}.Constant;
import com.mai.xmai_fast_lib.utils.MLog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import rx.Observable;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.schedulers.Schedulers;

/**
 * Created by aye on 2016/1/11.
 */
public class BitmapUtils {

    private static final int DEFAULT_REQUIRED_SIZE = 70;

    //压缩图片到指定的大小
    public static Bitmap decodeFile(File f, int size) {
        try {
            BitmapFactory.Options option = new BitmapFactory.Options();
            option.inJustDecodeBounds = true;
            FileInputStream stream1 = new FileInputStream(f);
            BitmapFactory.decodeStream(stream1, null, option);
            stream1.close();
            final int REQUIRED_SIZE = size > 0 ? size : DEFAULT_REQUIRED_SIZE;
            int width_tmp = option.outWidth, height_tmp = option.outHeight;
            int scale = 1;
            while (true) {
                if (width_tmp / 2 < REQUIRED_SIZE
                        || height_tmp / 2 < REQUIRED_SIZE)
                    break;
                width_tmp /= 2;
                height_tmp /= 2;
                scale *= 2;
            }
            if (scale >= 2) {
                scale /= 2;
            }
            BitmapFactory.Options option2 = new BitmapFactory.Options();
            option2.inSampleSize = scale;
            FileInputStream stream2 = new FileInputStream(f);
            Bitmap bitmap = BitmapFactory.decodeStream(stream2, null, option2);
            stream2.close();
            return bitmap;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 获取图片信息
     *
     * @param path
     * @return 返回图片的旋转角度
     */
    public static int readPictureDegree(String path) {
        int degree = 0;
        try {
            ExifInterface exifInterface = new ExifInterface(path);
            int orientation = exifInterface.getAttributeInt(
                    ExifInterface.TAG_ORIENTATION,
                    ExifInterface.ORIENTATION_NORMAL);
            switch (orientation) {
                case ExifInterface.ORIENTATION_ROTATE_90:
                    degree = 90;
                    break;
                case ExifInterface.ORIENTATION_ROTATE_180:
                    degree = 180;
                    break;
                case ExifInterface.ORIENTATION_ROTATE_270:
                    degree = 270;
                    break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return degree;

    }

    /**
     * 图片旋转
     *
     * @param angle
     * @param
     * @return
     */
    public static Bitmap rotaingBitmap(int angle, String filePath) {
        Bitmap bitmap = BitmapFactory.decodeFile(filePath);
        // 旋转图片 动作
        Matrix matrix = new Matrix();
        matrix.postRotate(angle);
        System.out.println("angle=" + angle);
        // 创建新的图片
        Bitmap resizedBitmap = Bitmap.createBitmap(bitmap, 0, 0,
                bitmap.getWidth(), bitmap.getHeight(), matrix, true);
        return resizedBitmap;
    }

    /**
     * 保存图片到指定文件
     *
     * @param bm
     */
    public static void compressBitmap(final Bitmap bm, String filePath) {
        try {
            bm.compress(Bitmap.CompressFormat.PNG, 100, new FileOutputStream(
                    new File(filePath)));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    //此方法用来进行截图操作
    public static Bitmap screenShot(View view) {
        int width = view.getWidth();
        int height = view.getHeight();
        Bitmap bmp = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bmp);
        view.draw(canvas);
        return bmp;
    }

    //此方法用来进行截图操作
    public static void screenShot(View view, Action0 action0, Action1<String> action1) {
        final File dir = new File(Constant.SCREEN_SHOT_PATH);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Bitmap bmp = screenShot(view);
        Observable.just(bmp).map(new Func1<Bitmap, String>() {
            @Override
            public String call(Bitmap bmp) {
                String fileName = dir.getAbsolutePath() + File.separator + "screenshot.jpg";
                BitmapUtils.compressBitmap(bmp, fileName);
                return fileName;
            }
        }).subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnSubscribe(action0).subscribe(action1, new Action1<Throwable>() {
            @Override
            public void call(Throwable throwable) {
                throwable.printStackTrace();
                MLog.log("分享出错");
            }
        });
    }
}
