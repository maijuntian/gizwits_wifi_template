package ${packageName};

import android.os.Environment;

/**
 * Created by mai on 16/7/29.
 */
public class Constant {

    public static final String BASE_URL = "http://donlim-cloud.xtremeprog.com/api/";
    //
    public static final String APP_ID = "${APP_ID}";
    public static final String APP_SECRET = "${APP_SECRET}";
    public static final String PRODUCT_SECRET = "${PRODUCT_SECRET}";
    public static final String PRODUCT_KEY = "${PRODUCT_KEY}";

    public static final String BASE_PATH = Environment
            .getExternalStorageDirectory().getPath() + "/xinbao/";

    public static final String SDCARD_CACHE_IMG_PATH = BASE_PATH
            + "upload/";

    public static final String SDCARD_DOWNLOAD_PATH = BASE_PATH
            + "dowload/";

    public static final String BASE_IMAGE_CACHE = BASE_PATH + "cache/images";

    public static final String SCREEN_SHOT_PATH = BASE_PATH
            + "screenshot/";

    public static final String SCREEEN_SHOT_IMAGE = SCREEN_SHOT_PATH
            + "shot.png";

}
