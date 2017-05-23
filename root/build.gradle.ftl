
android {
    defaultConfig {
        minSdkVersion 16
        ndk {
            abiFilters 'armeabi-v7a'
        }
    }
    sourceSets {
        main {
            jniLibs.srcDir 'libs'
        }
    }

    productFlavors {
        armv7 {
            ndk {
                abiFilters "armeabi-v7a"
            }
        }
        x86 {
            ndk {
                abiFilters "x86"
            }
        }
    }

    dexOptions {
        preDexLibraries = false
    }
    lintOptions {
        checkReleaseBuilds false
    }
}

repositories {
    maven {
        url 'https://download.01.org/crosswalk/releases/crosswalk/android/maven2'
    }
}

apply plugin: 'com.neenbedankt.android-apt'

dependencies {
    compile 'om.mai.xmai_fast_lib:Xmai:1.1.6'
    compile 'com.mai.xgreeendao:greendaox_annotate:1.0.0'
    compile 'com.mai.xgreeendao:greendaox_code:1.0.0'
    apt 'com.mai.xgreeendao:greendaox_processor:1.0.0'
    compile 'org.xwalk:xwalk_core_library:22.52.561.4'
}
