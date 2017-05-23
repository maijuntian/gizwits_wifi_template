package ${packageName}.delegate;

import android.widget.ImageView;
import android.widget.ListView;

import com.gizwits.gizwifisdk.api.GizUserInfo;
import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import com.mai.xmai_fast_lib.baseadapter.BaseListViewAdapter;
import com.mai.xmai_fast_lib.baseadapter.BaseViewHolder;

import java.util.List;

import butterknife.Bind;


public class ShareDeviceDelegate extends BaseDelegate<BaseViewTitle> {

    @Bind(R.id.iv_qrcode)
    public ImageView ivQrcode;
    @Bind(R.id.lv_user)
    ListView lvUser;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_share_device;
    }

    @Override
    public void initWidget() {
        initBaseTitleBar(R.string.share_device);
    }

    public void initUsers(List<GizUserInfo> userInfos) {

        lvUser.setAdapter(new BaseListViewAdapter<GizUserInfo>(userInfos) {
            @Override
            protected int bindLayoutId(int position) {
                return R.layout.item_share_user;
            }

            @Override
            protected void initView(GizUserInfo data, BaseViewHolder viewHolder) {
                viewHolder.setText(R.id.tv_time, data.getDeviceBindTime())
                        .setText(R.id.tv_phone, data.getPhone())
                        .setTag(R.id.tv_unbind, viewHolder.getPosition())
                        .setOnClickListener(mOnClickListener, R.id.tv_unbind);
            }
        });
    }
}


