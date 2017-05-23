package ${packageName}.delegate;

import android.view.SurfaceHolder;
import android.view.SurfaceView;

import ${packageName}.R;
import ${packageName}.base.BaseDelegate;
import ${packageName}.base.BaseViewTitle;
import ${packageName}.qrcode.decode.ViewfinderView;

import butterknife.Bind;

/**
 * Created by hayashieiqi on 16/9/12.
 */
public class ScanQrDelegate extends BaseDelegate<BaseViewTitle> {
    @Bind(R.id.preview_view)
    SurfaceView surfaceView;

    @Bind(R.id.viewfinder_view)
    public ViewfinderView viewfinderView;

    @Override
    public int getRootLayoutId() {
        return R.layout.activity_scan_qr;
    }

    public SurfaceHolder getHolder() {
        return surfaceView.getHolder();
    }

    @Override
    public void initWidget() {
        super.initWidget();
        initBaseTitleBar(mContext.getString(R.string.scan_qrcode));
    }
}
