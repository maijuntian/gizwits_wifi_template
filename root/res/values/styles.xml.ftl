<resources>

    <!-- Base application theme. -->
    <style name="AppTheme" parent="Theme.AppCompat.Light.NoActionBar">
        <!-- Customize your theme here. -->
        <item name="colorPrimary">@color/colorPrimary</item>
        <item name="colorPrimaryDark">@color/colorPrimaryDark</item>
        <item name="colorAccent">@color/colorAccent</item>
        <item name="android:textColorHint">@color/text_gray</item>
    </style>

    <style name="LoadingDialog" parent="@android:style/Theme.Dialog">
        <item name="android:windowFrame">@null</item>
        <item name="android:windowNoTitle">true</item>
        <item name="android:windowBackground">@color/trans</item>
        <item name="android:windowIsFloating">true</item>
        <item name="android:windowContentOverlay">@null</item>
    </style>

    <!--重写系统弹出Dialog -->
    <style name="myDialogTheme">
        <item name="android:windowFrame">@null</item>
        <item name="android:windowIsFloating">true</item>
        <item name="android:windowIsTranslucent">false</item>
        <item name="android:windowNoTitle">true</item><!--除去title-->
        <item name="android:windowContentOverlay">@null</item>
        <item name="android:windowBackground">@null</item><!--除去背景色-->
    </style>


    <style name="text_small">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_small</item>
    </style>

    <style name="text_normal">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_normal</item>
    </style>

    <style name="text_default">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_default</item>
    </style>

    <style name="text_large">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_large</item>
    </style>

    <style name="text_xlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xlarge</item>
    </style>

    <style name="text_xxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxlarge</item>
    </style>

    <style name="text_xxxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxxlarge</item>
    </style>

    <style name="text_xxxxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxxxlarge</item>
    </style>

    <style name="text_xxxxxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxxxxlarge</item>
    </style>

    <style name="text_xxxxxxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxxxxxlarge</item>
    </style>

    <style name="text_xxxxxxxlarge">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textSize">@dimen/font_size_xxxxxxxlarge</item>
    </style>

    <style name="text_white_small" parent="@style/text_small">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_normal" parent="@style/text_normal">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_default" parent="@style/text_default">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_large" parent="@style/text_large">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_xlarge" parent="@style/text_xlarge">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_xxlarge" parent="@style/text_xxlarge">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_xxxlarge" parent="@style/text_xxxlarge">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_xxxxlarge" parent="@style/text_xxxxlarge">
        <item name="android:textColor">@color/white</item>
    </style>

    <style name="text_white_xxxxxlarge" parent="@style/text_xxxxxlarge">
        <item name="android:textColor">@color/white</item>
    </style>x

    <style name="text_white_xxxxxxxlarge" parent="@style/text_xxxxxxxlarge">
        <item name="android:textColor">@color/white</item>
    </style>


    <style name="text_gray_small" parent="@style/text_small">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_normal" parent="@style/text_normal">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_default" parent="@style/text_default">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_large" parent="@style/text_large">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_xlarge" parent="@style/text_xlarge">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_xxlarge" parent="@style/text_xxlarge">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_xxxlarge" parent="@style/text_xxxlarge">
        <item name="android:textColor">@color/text_xgray</item>
    </style>

    <style name="text_gray_xxxxlarge" parent="@style/text_xxxxlarge">
        <item name="android:textColor">@color/text_xgray</item>
    </style>


    <style name="text_xxgray_small" parent="@style/text_small">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_normal" parent="@style/text_normal">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_default" parent="@style/text_default">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_large" parent="@style/text_large">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_xlarge" parent="@style/text_xlarge">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_xxlarge" parent="@style/text_xxlarge">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_xxxlarge" parent="@style/text_xxxlarge">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_xxgray_xxxxlarge" parent="@style/text_xxxxlarge">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="text_black_small" parent="@style/text_small">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_normal" parent="@style/text_normal">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_default" parent="@style/text_default">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_large" parent="@style/text_large">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_xlarge" parent="@style/text_xlarge">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_xxlarge" parent="@style/text_xxlarge">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_xxxlarge" parent="@style/text_xxxlarge">
        <item name="android:textColor">@color/black</item>
    </style>

    <style name="text_black_xxxxlarge" parent="@style/text_xxxxlarge">
        <item name="android:textColor">@color/black</item>
    </style>


    <style name="text_app_color_small" parent="@style/text_small">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_normal" parent="@style/text_normal">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_default" parent="@style/text_default">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_large" parent="@style/text_large">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xlarge" parent="@style/text_xlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xxlarge" parent="@style/text_xxlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xxxlarge" parent="@style/text_xxxlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xxxxlarge" parent="@style/text_xxxxlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xxxxxxxlarge" parent="@style/text_xxxxxxxlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="text_app_color_xxxxxxlarge" parent="@style/text_xxxxxxlarge">
        <item name="android:textColor">@color/app_color</item>
    </style>

    <style name="button_app_color">
        <item name="android:layout_width">match_parent</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:background">@drawable/bt_app_color_seletor</item>
        <item name="android:paddingBottom">10dp</item>
        <item name="android:paddingTop">10dp</item>
        <item name="android:gravity">center</item>
        <item name="android:textColor">@color/white</item>
        <item name="android:textSize">@dimen/font_size_large</item>
    </style>

    <style name="pay_detail_title_tv">
        <item name="android:layout_width">0dp</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:layout_weight">0.4</item>
    </style>
    <style name="pay_detail_tv">
        <item name="android:layout_width">0dp</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textColor">@color/gray</item>
        <item name="android:layout_weight">1</item>
    </style>

    <style name="divider_line">
        <item name="android:layout_width">match_parent</item>
        <item name="android:layout_height">0.5dp</item>
        <item name="android:background">@color/text_gray</item>
    </style>

    <style name="divider_line_s">
        <item name="android:layout_width">match_parent</item>
        <item name="android:layout_height">0.5dp</item>
        <item name="android:background">@color/text_sgray</item>
    </style>

    <style name="edit_style">
        <item name="android:layout_height">wrap_content</item>
        <item name="android:layout_width">match_parent</item>
        <item name="android:maxLines">1</item>
        <item name="android:background">@color/trans</item>
        <item name="android:textSize">@dimen/font_size_normal</item>
        <item name="android:gravity">center_vertical</item>
        <item name="android:paddingTop">15dp</item>
        <item name="android:paddingBottom">15dp</item>
        <item name="android:textCursorDrawable">@drawable/cursor_color</item>
    </style>

    <style name="edit_style_black" parent="edit_style">
        <item name="android:textColor">@color/text_xxgray</item>
    </style>

    <style name="edit_style_black_pwd" parent="edit_style_black">
        <item name="android:password">true</item>
        <item name="android:maxLength">16</item>
    </style>

    <style name="menu_item_style" parent="text_black_large">
        <item name="android:layout_width">match_parent</item>
        <item name="android:drawablePadding">10dp</item>
        <item name="android:drawableRight">@mipmap/list_ic_arrow</item>
        <item name="android:gravity">center_vertical</item>
        <item name="android:paddingBottom">25dp</item>
        <item name="android:paddingRight">20dp</item>
        <item name="android:paddingTop">25dp</item>
    </style>

</resources>
