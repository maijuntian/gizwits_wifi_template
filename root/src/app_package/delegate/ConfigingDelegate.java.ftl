package ${packageName}.delegate;

import android.app.Activity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;

import java.util.concurrent.TimeUnit;

import butterknife.Bind;
import rx.Observable;
import rx.Subscription;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action1;


public class ConfigingDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.tv_second)
    TextView tvSecond;
    @Bind(R.id.ll_configing)
    LinearLayout llConfiging;
    @Bind(R.id.tv_config_succ)
    TextView tvConfigSucc;
    @Bind(R.id.tv_reconfig)
    TextView tvReconfig;
    @Bind(R.id.tv_config_fail)
    TextView tvConfigFail;
    @Bind(R.id.rl_fail)
    RelativeLayout rlFail;

    public Subscription subscription;

    int timeDown;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_configing;
    }

    @Override
    public void initWidget() {
        tvBaseBarLeft.setVisibility(View.GONE);
        initBaseTitleBar(getString(R.string.config_device));
    }

    public void startConnect() {
        rlFail.setVisibility(View.GONE);
        tvConfigSucc.setVisibility(View.GONE);
        llConfiging.setVisibility(View.VISIBLE);

        timeDown = 60;
        tvSecond.setText(timeDown + mContext.getString(R.string.second));
        subscription = Observable.interval(1000, TimeUnit.MILLISECONDS).observeOn(AndroidSchedulers.mainThread()).subscribe(new Action1<Long>() {
            @Override
            public void call(Long aLong) {
                timeDown--;
                if (timeDown < 0) {
                    subscription.unsubscribe();
                }
                tvSecond.setText(timeDown + mContext.getString(R.string.second));

            }
        });
    }

    public void connectSuccess() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            @Override
            public void run() {
                subscription.unsubscribe();
                rlFail.setVisibility(View.GONE);
                tvConfigSucc.setVisibility(View.VISIBLE);
                llConfiging.setVisibility(View.GONE);
            }
        });
    }

    public void connectFail() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            @Override
            public void run() {
                subscription.unsubscribe();
                rlFail.setVisibility(View.VISIBLE);
                tvConfigSucc.setVisibility(View.GONE);
                llConfiging.setVisibility(View.GONE);
                tvBaseBarLeft.setVisibility(View.VISIBLE);
            }
        });
    }
}


