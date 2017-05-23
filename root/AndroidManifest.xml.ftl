<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_MULTICAST_STATE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-permission android:name="android.permission.INTERACT_ACROSS_USERS_FULL" />
    <uses-permission android:name="android.permission.CALL_PHONE" />
    <uses-permission android:name="android.permission.WRITE_SETTINGS" />

    <application
        android:name=".MyApplication"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme">
        <activity android:name=".activity.SplashActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <activity
            android:name=".activity.MainActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.LoginActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.RegisterActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ForgetPwd1Activity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ForgetPwd2Activity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.DeviceManagerActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ConfigSearchActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ConfigWifiActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ConfigPreActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ConfigingActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.UserInfoActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.UpdatePwdActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.DeviceEditActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.AboutUsActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ScanQrActivity"
            android:screenOrientation="portrait" />
        <activity
            android:name=".activity.ShareDeviceActivity"
            android:screenOrientation="portrait" />
    </application>

</manifest>