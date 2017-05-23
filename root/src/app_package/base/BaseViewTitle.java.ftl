package ${packageName}.base;

import android.app.Activity;
import android.view.View;


/**
 * 主界面的基础界面
 * @author mai
 *
 */
public class BaseViewTitle extends BaseBaseView{

	@Override
	public void initBaseView(final View view) {
		getLeftView(view).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				((Activity)view.getContext()).finish();
			}
		});


	}
}
