package ${packageName}.activity;

import android.Manifest;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import ${packageName}.MyApplication;
import ${packageName}.R;
import ${packageName}.base.BaseActivity;
import ${packageName}.delegate.SplashDelegate;
import ${packageName}.service.UserService;
import ${packageName}.utils.DialogUtils;
import com.mai.xmai_fast_lib.utils.MLog;
import com.mai.xmai_fast_lib.utils.XAppManager;

import java.util.concurrent.TimeUnit;

import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action0;
import rx.functions.Action1;

/**
 * @author app启动页面
 */
public class SplashActivity extends BaseActivity<SplashDelegate> {


    private final int PERMISSION_REQUEST_CODE = 1;

    String[] perms = {Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.CAMERA, Manifest.permission.CALL_PHONE};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        checkPermission();
    }

    @Override
    public boolean isStatusBarTranslucent() {
        return false;
    }

    private void checkPermission() {
        if (hasPermissions()) {
            MLog.log("有权限");
            toMainActivity();
        } else {
            ActivityCompat.requestPermissions(this, perms,
                    PERMISSION_REQUEST_CODE);
        }
    }

    private boolean hasPermissions() {
        for (String perm : perms) {
            if (ContextCompat.checkSelfPermission(this, perm) != PackageManager.PERMISSION_GRANTED) {
                return false;
            }
        }
        return true;
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        doNext(requestCode, grantResults);
    }

    private void doNext(int requestCode, int[] grantResults) {
        if (requestCode == PERMISSION_REQUEST_CODE) {
            boolean isGranted = true;
            for (int result : grantResults) {
                if (result != PackageManager.PERMISSION_GRANTED) {
                    isGranted = false;
                }
            }
            if (isGranted) { //允许
                MLog.log("全部允许了");
                toMainActivity();
            } else {
                MLog.log("不允许了");
                DialogUtils.showDialog(this, getString(R.string.permission_alarm), new Action0() {
                    @Override
                    public void call() {
                        XAppManager.getInstance().AppExit(SplashActivity.this, false);
                    }
                });
            }
        }
    }

    private void toMainActivity() {
        MyApplication.getInstance().initGizwit();
        //这里使用rxjava的timer操作符进行了1500毫秒的延时跳转
        rx.Observable.timer(1500, TimeUnit.MILLISECONDS, AndroidSchedulers.mainThread()).subscribe(new Action1<Long>() {
            @Override
            public void call(Long aLong) {
                if (UserService.checkUser(SplashActivity.this)) {
                    startActivity(MainActivity.class, true);
                } else {
                    finish();
                }
            }
        });
    }

}
