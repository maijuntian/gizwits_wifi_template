package ${packageName}.base;

import ${packageName}.widget.LoadingDialog;
import com.mai.xmai_fast_lib.mvvm.presenter.FragmentPresenter;
import com.mai.xmai_fast_lib.mvvm.view.IDelegate;

/**
 * Created by mai on 16/7/27.
 */
public class BaseFragment<T extends IDelegate> extends FragmentPresenter<T> {

    private LoadingDialog loadingDialog;

    protected void showLoadingDialog() {
        if(loadingDialog == null)
            loadingDialog = new LoadingDialog(getActivity());
        loadingDialog.show();
    }

    public void dismissLoadingDialog() {
        if(loadingDialog != null)
            loadingDialog.dismiss();
    }


    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public void onPause() {
        super.onPause();
    }
}
