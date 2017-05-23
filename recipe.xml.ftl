<?xml version="1.0"?>
<recipe>
    
    <merge from="root/AndroidManifest.xml.ftl"
            to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <copy from="root/assets/HelveticaNeueLTStd-Th.otf"
                   to="${escapeXmlAttribute(manifestOut)}/assets/HelveticaNeueLTStd-Th.otf" />

    <merge from="root/build.gradle.ftl"
                   to="${escapeXmlAttribute(projectOut)}/build.gradle" />

    <merge from="root/build-global.gradle.ftl"
                   to="${escapeXmlAttribute(topOut)}/build.gradle" />

    <copy from="root/libs/BLEasyConfig.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/BLEasyConfig.jar" />

    <copy from="root/libs/easylink2.0.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/easylink2.0.jar" />


    <copy from="root/libs/GizWifiSDK.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/GizWifiSDK.jar" />

    <copy from="root/libs/hiflying-iots-android-smartlink7.0.2.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/hiflying-iots-android-smartlink7.0.2.jar" />

    <copy from="root/libs/jxl.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/jxl.jar" />

    <copy from="root/libs/Lark7618SDK_noudp1606031910_0101.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/Lark7618SDK_noudp1606031910_0101.jar" />

    <copy from="root/libs/libEsptouch_v0.3.3.4_3.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/libEsptouch_v0.3.3.4_3.jar" />

    <copy from="root/libs/libForEElink.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/libForEElink.jar" />

    <copy from="root/libs/LSFSK_1.0.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/LSFSK_1.0.jar" />

    <copy from="root/libs/OneShotConfig.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/OneShotConfig.jar" />

    <copy from="root/libs/simpleconfigwizardlib.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/simpleconfigwizardlib.jar" />

    <copy from="root/libs/zxing.jar"
                   to="${escapeXmlAttribute(projectOut)}/libs/zxing.jar" />

    <copy from="root/libs/armeabi-v7a/libBLEasyConfig.ftl"
                   to="${escapeXmlAttribute(projectOut)}/libs/armeabi-v7a/libBLEasyConfig.so" />
    <copy from="root/libs/armeabi-v7a/libSDKLog.ftl"
                   to="${escapeXmlAttribute(projectOut)}/libs/armeabi-v7a/libSDKLog.so" />
    <copy from="root/libs/armeabi-v7a/libsimpleconfiglib.ftl"
                   to="${escapeXmlAttribute(projectOut)}/libs/armeabi-v7a/libsimpleconfiglib.so" />
    <copy from="root/libs/armeabi-v7a/libwavegen.ftl"
                   to="${escapeXmlAttribute(projectOut)}/libs/armeabi-v7a/libwavegen.so" />


    <instantiate from="root/src/app_package/activity/AboutUsActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/AboutUsActivity.java" />

    <instantiate from="root/src/app_package/activity/ConfigingActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ConfigingActivity.java" />

    <instantiate from="root/src/app_package/activity/ConfigPreActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ConfigPreActivity.java" />

    <instantiate from="root/src/app_package/activity/ConfigSearchActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ConfigSearchActivity.java" />

    <instantiate from="root/src/app_package/activity/ConfigWifiActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ConfigWifiActivity.java" />

    <instantiate from="root/src/app_package/activity/DeviceEditActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/DeviceEditActivity.java" />

    <instantiate from="root/src/app_package/activity/DeviceManagerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/DeviceManagerActivity.java" />

    <instantiate from="root/src/app_package/activity/ForgetPwd1Activity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ForgetPwd1Activity.java" />

    <instantiate from="root/src/app_package/activity/ForgetPwd2Activity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ForgetPwd2Activity.java" />

    <instantiate from="root/src/app_package/activity/LoginActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/LoginActivity.java" />

    <instantiate from="root/src/app_package/activity/MainActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/MainActivity.java" />

    <instantiate from="root/src/app_package/activity/RegisterActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/RegisterActivity.java" />

    <instantiate from="root/src/app_package/activity/ScanQrActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ScanQrActivity.java" />

    <instantiate from="root/src/app_package/activity/ShareDeviceActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/ShareDeviceActivity.java" />

    <instantiate from="root/src/app_package/activity/SplashActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/SplashActivity.java" />

    <instantiate from="root/src/app_package/activity/UpdatePwdActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/UpdatePwdActivity.java" />

    <instantiate from="root/src/app_package/activity/UserInfoActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/UserInfoActivity.java" />


    <instantiate from="root/src/app_package/base/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseActivity.java" />

    <instantiate from="root/src/app_package/base/BaseBaseView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseBaseView.java" />

    <instantiate from="root/src/app_package/base/BaseDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseDelegate.java" />

    <instantiate from="root/src/app_package/base/BaseFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseFragment.java" />

    <instantiate from="root/src/app_package/base/BaseViewTitle.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseViewTitle.java" />

    <instantiate from="root/src/app_package/bean/DeviceStatus.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bean/DeviceStatus.java" />

    <instantiate from="root/src/app_package/bean/User.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bean/User.java" />

    <instantiate from="root/src/app_package/Constant.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/Constant.java" />

    <instantiate from="root/src/app_package/delegate/AboutUsDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/AboutUsDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ConfigingDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ConfigingDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ConfigPreDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ConfigPreDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ConfigSearchDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ConfigSearchDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ConfigWifiDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ConfigWifiDelegate.java" />

    <instantiate from="root/src/app_package/delegate/DeviceEditDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/DeviceEditDelegate.java" />

    <instantiate from="root/src/app_package/delegate/DeviceManagerDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/DeviceManagerDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ForgetPwd1Delegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ForgetPwd1Delegate.java" />

    <instantiate from="root/src/app_package/delegate/ForgetPwd2Delegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ForgetPwd2Delegate.java" />

    <instantiate from="root/src/app_package/delegate/LoginDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/LoginDelegate.java" />

    <instantiate from="root/src/app_package/delegate/MainDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/MainDelegate.java" />

    <instantiate from="root/src/app_package/delegate/RegisterDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/RegisterDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ScanQrDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ScanQrDelegate.java" />

    <instantiate from="root/src/app_package/delegate/ShareDeviceDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/ShareDeviceDelegate.java" />

    <instantiate from="root/src/app_package/delegate/SplashDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/SplashDelegate.java" />

    <instantiate from="root/src/app_package/delegate/UpdatePwdDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/UpdatePwdDelegate.java" />

    <instantiate from="root/src/app_package/delegate/UserInfoDelegate.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/delegate/UserInfoDelegate.java" />

    <instantiate from="root/src/app_package/MyApplication.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/MyApplication.java" />

    <instantiate from="root/src/app_package/qrcode/camera/AutoFocusCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/AutoFocusCallback.java" />

    <instantiate from="root/src/app_package/qrcode/camera/CameraConfigurationManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/CameraConfigurationManager.java" />

    <instantiate from="root/src/app_package/qrcode/camera/CameraManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/CameraManager.java" />

    <instantiate from="root/src/app_package/qrcode/camera/Comm.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/Comm.java" />

    <instantiate from="root/src/app_package/qrcode/camera/PlanarYUVLuminanceSource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/PlanarYUVLuminanceSource.java" />

    <instantiate from="root/src/app_package/qrcode/camera/PreviewCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/camera/PreviewCallback.java" />

    <instantiate from="root/src/app_package/qrcode/decode/CaptureActivityHandler.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/CaptureActivityHandler.java" />

    <instantiate from="root/src/app_package/qrcode/decode/DecodeFormatManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/DecodeFormatManager.java" />

    <instantiate from="root/src/app_package/qrcode/decode/DecodeHandler.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/DecodeHandler.java" />

    <instantiate from="root/src/app_package/qrcode/decode/DecodeThread.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/DecodeThread.java" />

    <instantiate from="root/src/app_package/qrcode/decode/FinishListener.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/FinishListener.java" />

    <instantiate from="root/src/app_package/qrcode/decode/InactivityTimer.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/InactivityTimer.java" />

    <instantiate from="root/src/app_package/qrcode/decode/Intents.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/Intents.java" />

    <instantiate from="root/src/app_package/qrcode/decode/RGBLuminanceSource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/RGBLuminanceSource.java" />

    <instantiate from="root/src/app_package/qrcode/decode/ViewfinderResultPointCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/ViewfinderResultPointCallback.java" />

    <instantiate from="root/src/app_package/qrcode/decode/ViewfinderView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/qrcode/decode/ViewfinderView.java" />

    <instantiate from="root/src/app_package/service/UserService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/service/UserService.java" />


    <instantiate from="root/src/app_package/utils/AlbumUtil.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/AlbumUtil.java" />

    <instantiate from="root/src/app_package/utils/BitmapUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/BitmapUtils.java" />

    <instantiate from="root/src/app_package/utils/CmdUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/CmdUtils.java" />

    <instantiate from="root/src/app_package/utils/CommonUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/CommonUtils.java" />

    <instantiate from="root/src/app_package/utils/DialogUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/DialogUtils.java" />

    <instantiate from="root/src/app_package/utils/DisplayUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/DisplayUtils.java" />

    <instantiate from="root/src/app_package/utils/GIzErrorHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/GIzErrorHelper.java" />

    <instantiate from="root/src/app_package/utils/GlideCircleTransform.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/GlideCircleTransform.java" />

    <instantiate from="root/src/app_package/utils/GlideCornerTransform.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/GlideCornerTransform.java" />

    <instantiate from="root/src/app_package/utils/GlideTopCornerTransform.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/GlideTopCornerTransform.java" />

    <instantiate from="root/src/app_package/utils/Keys.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/Keys.java" />

    <instantiate from="root/src/app_package/utils/MGlide.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/MGlide.java" />

    <instantiate from="root/src/app_package/utils/MToast.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/MToast.java" />

    <instantiate from="root/src/app_package/utils/NetUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/NetUtils.java" />

    <instantiate from="root/src/app_package/widget/DividerItemDecoration.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/DividerItemDecoration.java" />

    <instantiate from="root/src/app_package/widget/GridViewForScrollView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/GridViewForScrollView.java" />

    <instantiate from="root/src/app_package/widget/JustifyTextView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/JustifyTextView.java" />

    <instantiate from="root/src/app_package/widget/ListViewForScrollView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/ListViewForScrollView.java" />

    <instantiate from="root/src/app_package/widget/LoadingDialog.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/LoadingDialog.java" />

    <instantiate from="root/src/app_package/widget/NoPaddingTextView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/NoPaddingTextView.java" />

    <instantiate from="root/src/app_package/widget/PasswordEditText.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/PasswordEditText.java" />

    <instantiate from="root/src/app_package/widget/SystemBarTintManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/SystemBarTintManager.java" />

    <instantiate from="root/src/app_package/widget/TagCloudConfiguration.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TagCloudConfiguration.java" />

    <instantiate from="root/src/app_package/widget/TagCloudLayout.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TagCloudLayout.java" />

    <instantiate from="root/src/app_package/widget/TextViewTimeCount.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TextViewTimeCount.java" />

    <instantiate from="root/src/app_package/widget/VerificationTextView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/VerificationTextView.java" />

    <instantiate from="root/src/app_package/XDBManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/XDBManager.java" />



    <copy from="root/res/mipmap-xhdpi/about_ic_help.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/about_ic_help.png" />

    <copy from="root/res/mipmap-xhdpi/back.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/back.png" />

    <copy from="root/res/mipmap-xhdpi/configure_ic_device.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/configure_ic_device.png" />

    <copy from="root/res/mipmap-xhdpi/configure_ic_light.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/configure_ic_light.png" />

    <copy from="root/res/mipmap-xhdpi/configure_ic_success.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/configure_ic_success.png" />

    <copy from="root/res/mipmap-xhdpi/configure_img.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/configure_img.png" />

    <copy from="root/res/mipmap-xhdpi/devicelist_ic_device.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/devicelist_ic_device.png" />

    <copy from="root/res/mipmap-xhdpi/edit_popup_delete.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/edit_popup_delete.png" />

    <copy from="root/res/mipmap-xhdpi/edit_popup.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/edit_popup.png" />

    <copy from="root/res/mipmap-xhdpi/forgot_btn.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/forgot_btn.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_cancel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_cancel.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_device_nor.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_device_nor.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_like_sel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_like_sel.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_recipes_nor.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_recipes_nor.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_recipes_sel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_recipes_sel.png" />

    <copy from="root/res/mipmap-xhdpi/home_ic_search.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/home_ic_search.png" />

    <copy from="root/res/mipmap-xhdpi/icon_shaomiao.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/icon_shaomiao.png" />

    <copy from="root/res/mipmap-xhdpi/introduce_img.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/introduce_img.png" />

    <copy from="root/res/mipmap-xhdpi/list_ic_arrow_down.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/list_ic_arrow_down.png" />

    <copy from="root/res/mipmap-xhdpi/list_ic_arrow.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/list_ic_arrow.png" />

    <copy from="root/res/mipmap-xhdpi/load_btn_add.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_btn_add.png" />

    <copy from="root/res/mipmap-xhdpi/load_btn_ic_refresh.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_btn_ic_refresh.png" />

    <copy from="root/res/mipmap-xhdpi/load_btn_refresh.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_btn_refresh.png" />

    <copy from="root/res/mipmap-xhdpi/load_ic_loading.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_ic_loading.png" />

    <copy from="root/res/mipmap-xhdpi/load_none.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_none.png" />

    <copy from="root/res/mipmap-xhdpi/load_popup_ic_fail.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_popup_ic_fail.png" />

    <copy from="root/res/mipmap-xhdpi/load_popup.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/load_popup.png" />

    <copy from="root/res/mipmap-xhdpi/loading.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/loading.png" />

    <copy from="root/res/mipmap-xhdpi/login_btn.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_btn.png" />

    <copy from="root/res/mipmap-xhdpi/login_ic_forgot.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_ic_forgot.png" />

    <copy from="root/res/mipmap-xhdpi/login_ic_new.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_ic_new.png" />

    <copy from="root/res/mipmap-xhdpi/login_ic_password.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_ic_password.png" />

    <copy from="root/res/mipmap-xhdpi/login_ic_phone.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_ic_phone.png" />

    <copy from="root/res/mipmap-xhdpi/login_logo.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/login_logo.png" />

    <copy from="root/res/mipmap-xhdpi/menu_devicelist_select_nor.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_devicelist_select_nor.png" />

    <copy from="root/res/mipmap-xhdpi/menu_devicelist_select_sel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_devicelist_select_sel.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_about.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_about.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_arrow_down.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_arrow_down.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_arrow_right.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_arrow_right.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_device.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_device.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_devicelist.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_devicelist.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_set.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_set.png" />

    <copy from="root/res/mipmap-xhdpi/menu_ic_user.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/menu_ic_user.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_add.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_add.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_back.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_back.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_back2.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_back2.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_back3.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_back3.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_edit_09.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_edit_09.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_edit.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_edit.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_like.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_like.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_menu.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_menu.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_time.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_time.png" />

    <copy from="root/res/mipmap-xhdpi/nav_ic_user.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/nav_ic_user.png" />

    <copy from="root/res/mipmap-xhdpi/recipes_ic_collect_sel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/recipes_ic_collect_sel.png" />

    <copy from="root/res/mipmap-xhdpi/recipes_ic_collect.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/recipes_ic_collect.png" />

    <copy from="root/res/mipmap-xhdpi/recipes_ic_comment.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/recipes_ic_comment.png" />

    <copy from="root/res/mipmap-xhdpi/register_ic_message.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/register_ic_message.png" />

    <copy from="root/res/mipmap-xhdpi/search_ic_none.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/search_ic_none.png" />

    <copy from="root/res/mipmap-xhdpi/see_nor.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/see_nor.png" />

    <copy from="root/res/mipmap-xhdpi/see_sel.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/see_sel.png" />

    <copy from="root/res/mipmap-xhdpi/switch_off.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/switch_off.png" />

    <copy from="root/res/mipmap-xhdpi/switch_on.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/switch_on.png" />

    <copy from="root/res/mipmap-xhdpi/user_head.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/user_head.png" />

    <copy from="root/res/mipmap-xhdpi/user_ic_edit.png"
                  to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi/user_ic_edit.png" />


    <copy from="root/res/anim/loading_rotate.xml"
                  to="${escapeXmlAttribute(resOut)}/anim/loading_rotate.xml" />

    <copy from="root/res/drawable/all_circle_gray.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/all_circle_gray.xml" />

    <copy from="root/res/drawable/all_circle_ssgray_orange.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/all_circle_ssgray_orange.xml" />

    <copy from="root/res/drawable/all_circle_trans_gray.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/all_circle_trans_gray.xml" />

    <copy from="root/res/drawable/all_circle_trans_orange.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/all_circle_trans_orange.xml" />

    <copy from="root/res/drawable/app_color_p.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/app_color_p.xml" />

    <copy from="root/res/drawable/app_color.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/app_color.xml" />


    <copy from="root/res/drawable/bg_corner_bottom_white.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_corner_bottom_white.xml" />

    <copy from="root/res/drawable/bg_corner_gray.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_corner_gray.xml" />

    <copy from="root/res/drawable/bg_corner_top_white.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_corner_top_white.xml" />

    <copy from="root/res/drawable/bg_corner_white.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_corner_white.xml" />

    <copy from="root/res/drawable/bg_progress.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_progress.xml" />

    <copy from="root/res/drawable/bg_trans_corner_gray.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_trans_corner_gray.xml" />

    <copy from="root/res/drawable/bg_trans_small_corner_gray.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bg_trans_small_corner_gray.xml" />

    <copy from="root/res/drawable/bt_app_color_bottom_corners.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_bottom_corners.xml" />

    <copy from="root/res/drawable/bt_app_color_corners_p.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_corners_p.xml" />

    <copy from="root/res/drawable/bt_app_color_corners_p2.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_corners_p2.xml" />

    <copy from="root/res/drawable/bt_app_color_corners.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_corners.xml" />

    <copy from="root/res/drawable/bt_app_color_corners2.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_corners2.xml" />

    <copy from="root/res/drawable/bt_app_color_p.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_p.xml" />

    <copy from="root/res/drawable/bt_app_color_right_bottom_corners.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_right_bottom_corners.xml" />

    <copy from="root/res/drawable/bt_app_color_seletor.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_seletor.xml" />

    <copy from="root/res/drawable/bt_app_color_seletor2.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_seletor2.xml" />

    <copy from="root/res/drawable/bt_app_color_seletor3.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_seletor3.xml" />

    <copy from="root/res/drawable/bt_app_color_trans_corners.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color_trans_corners.xml" />

    <copy from="root/res/drawable/bt_app_color.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/bt_app_color.xml" />

    <copy from="root/res/drawable/card_white_bg_corner.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/card_white_bg_corner.xml" />

    <copy from="root/res/drawable/cb_device_selector.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/cb_device_selector.xml" />

    <copy from="root/res/drawable/circular_orange.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/circular_orange.xml" />

    <copy from="root/res/drawable/circular_step.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/circular_step.xml" />

    <copy from="root/res/drawable/cursor_color.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/cursor_color.xml" />

    <copy from="root/res/drawable/loading_bg.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/loading_bg.xml" />

    <copy from="root/res/drawable/recipe_cache_bg.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/recipe_cache_bg.xml" />

    <copy from="root/res/drawable/recipe_corner_cache_bg.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/recipe_corner_cache_bg.xml" />

    <copy from="root/res/drawable/recipe_top_cache_bg.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/recipe_top_cache_bg.xml" />

    <copy from="root/res/drawable/switch_seletor.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/switch_seletor.xml" />

    <copy from="root/res/drawable/text_gray_orange_selector.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/text_gray_orange_selector.xml" />

    <copy from="root/res/drawable/text_white_orange_selector.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/text_white_orange_selector.xml" />

    <copy from="root/res/drawable/time_top_bg.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/time_top_bg.xml" />

    <copy from="root/res/drawable/title_bar_selector.xml"
                  to="${escapeXmlAttribute(resOut)}/drawable/title_bar_selector.xml" />

    <copy from="root/res/values/attrs.xml"
                  to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />

    <merge from="root/res/values/colors.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <copy from="root/res/values/dimens.xml"
                  to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

    <copy from="root/res/values/ids.xml"
                  to="${escapeXmlAttribute(resOut)}/values/ids.xml" />

    <copy from="root/res/values/strings_giz.xml"
                  to="${escapeXmlAttribute(resOut)}/values/strings_giz.xml" />

    <merge from="root/res/values/strings.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <merge from="root/res/values/styles.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/values/styles.xml" />


    <instantiate from="root/res/layout/activity_about_us.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_about_us.xml" />

    <copy from="root/res/layout/activity_base.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_base.xml" />

    <copy from="root/res/layout/activity_config_pre.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_config_pre.xml" />

    <copy from="root/res/layout/activity_config_search.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_config_search.xml" />

    <copy from="root/res/layout/activity_config_wifi.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_config_wifi.xml" />

    <copy from="root/res/layout/activity_configing.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_configing.xml" />

    <copy from="root/res/layout/activity_device_edit.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_device_edit.xml" />

    <copy from="root/res/layout/activity_device_manager.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_device_manager.xml" />

    <copy from="root/res/layout/activity_forget_pwd1.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_forget_pwd1.xml" />
                  
    <instantiate from="root/res/layout/activity_forget_pwd2.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_forget_pwd2.xml" />

    <instantiate from="root/res/layout/activity_login.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_login.xml" />

    <copy from="root/res/layout/activity_main.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_main.xml" />

    <instantiate from="root/res/layout/activity_register.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_register.xml" />

    <instantiate from="root/res/layout/activity_scan_qr.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_scan_qr.xml" />
                  
    <copy from="root/res/layout/activity_share_device.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_share_device.xml" />

    <copy from="root/res/layout/activity_splash.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_splash.xml" />

    <copy from="root/res/layout/activity_update_pwd.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_update_pwd.xml" />

    <copy from="root/res/layout/activity_user_info.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/activity_user_info.xml" />

    <copy from="root/res/layout/dialog_confirm.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/dialog_confirm.xml" />
                  
    <copy from="root/res/layout/dialog_loading.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/dialog_loading.xml" />

    <copy from="root/res/layout/dialog_no_wifi.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/dialog_no_wifi.xml" />

    <copy from="root/res/layout/dialog_select.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/dialog_select.xml" />

    <copy from="root/res/layout/dialog_update_name.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/dialog_update_name.xml" />

    <copy from="root/res/layout/item_device_searching.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/item_device_searching.xml" />

    <copy from="root/res/layout/item_menu_device.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/item_menu_device.xml" />

    <copy from="root/res/layout/item_share_user.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/item_share_user.xml" />

    <instantiate from="root/res/layout/view_menu_left.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/view_menu_left.xml" />

    <copy from="root/res/layout/view_toast.xml"
                  to="${escapeXmlAttribute(resOut)}/layout/view_toast.xml" />
                  

</recipe>
