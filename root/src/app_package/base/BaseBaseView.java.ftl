package ${packageName}.base;

import android.view.View;
import android.widget.TextView;

import ${packageName}.R;
import com.mai.xmai_fast_lib.baseview.inter.BaseViewInter;

import butterknife.ButterKnife;

public abstract class BaseBaseView implements BaseViewInter {
	@Override
	public int getBaseLayoutId() {
		return R.layout.activity_base;
	}

	@Override
	public int getBaseCenterLayoutId() {
		return R.id.ll_center_view;
	}

	@Override
	public int getBaseBarLeftId() {
		return R.id.tvBaseBarLeft;
	}

	@Override
	public int getBaseBarRightId() {
		return R.id.tvBaseBarRight;
	}

	@Override
	public int getBaseBarTitleId() {
		return R.id.tvBaseBarTitle;
	}


	public TextView getLeftView(View view){
		return ButterKnife.findById(view, getBaseBarLeftId());
	}

	public TextView getRightView(View view){
		return ButterKnife.findById(view, getBaseBarRightId());
	}

	public TextView getTitleView(View view){
		return ButterKnife.findById(view, getBaseBarTitleId());
	}

	public TextView getCenterView(View view){
		return ButterKnife.findById(view, getBaseCenterLayoutId());
	}
}
