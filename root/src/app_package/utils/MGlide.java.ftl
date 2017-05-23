package ${packageName}.utils;

import android.text.TextUtils;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.resource.bitmap.CenterCrop;
import ${packageName}.Constant;
import ${packageName}.MyApplication;
import ${packageName}.R;
import com.mai.xmai_fast_lib.utils.MLog;


/**
 * Created by mai on 16/8/25.
 */
public class MGlide {

    public static String parseUrl(String url) {
        if (url != null && !url.contains("http://")) {
            url = Constant.BASE_URL + "file/get/" + url;
        }
        MLog.log("加载图片url:" + url);
        return url;
    }

    public static void initImageView(ImageView imageView) {
//        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
    }

    public static void load(String url, ImageView imageView) {
        initImageView(imageView);
        url = parseUrl(url);
        Glide.with(MyApplication.getInstance().getApplicationContext()).load(url).placeholder(R.drawable.recipe_cache_bg).error(R.drawable.recipe_cache_bg).centerCrop().into(imageView);
    }

    public static void loadCircle(String url, ImageView imageView) {
        initImageView(imageView);
        url = parseUrl(url);
        Glide.with(MyApplication.getInstance().getApplicationContext()).load(url).transform(new CenterCrop(MyApplication.getInstance().getApplicationContext()), new GlideCircleTransform(MyApplication.getInstance().getApplicationContext())).placeholder(R.drawable.loading_bg).error(R.drawable.loading_bg).into(imageView);
    }

    public static void loadTopCorner(String url, ImageView imageView) {
        initImageView(imageView);
        url = parseUrl(url);
        Glide.with(MyApplication.getInstance().getApplicationContext()).load(url).transform(new CenterCrop(MyApplication.getInstance().getApplicationContext()), new GlideTopCornerTransform(MyApplication.getInstance().getApplicationContext(), 10)).placeholder(R.drawable.recipe_top_cache_bg).error(R.drawable.recipe_top_cache_bg).into(imageView);
    }

    public static void loadCorner(String url, ImageView imageView) {

        loadCorner(url, imageView, 10);
    }

    public static void loadCorner(String url, ImageView imageView, int dp) {
        initImageView(imageView);
        url = parseUrl(url);
        Glide.with(MyApplication.getInstance().getApplicationContext()).load(url).transform(new CenterCrop(MyApplication.getInstance().getApplicationContext()), new GlideCornerTransform(MyApplication.getInstance().getApplicationContext(), dp)).placeholder(R.drawable.recipe_corner_cache_bg).error(R.drawable.recipe_cache_bg).into(imageView);
    }
}
