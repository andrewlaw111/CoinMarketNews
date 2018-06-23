package com.coinmarketnews;

import com.lugg.ReactNativeConfig.ReactNativeConfigPackage;
import com.dylanvann.fastimage.FastImageViewPackage;
import com.reactnativenavigation.NavigationApplication;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.oblador.vectoricons.VectorIconsPackage;
import com.facebook.react.shell.MainReactPackage;
import com.geektime.rnonesignalandroid.ReactNativeOneSignalPackage;

import java.util.Arrays;
import java.util.List;

 public class MainApplication extends NavigationApplication {

     @Override
     public boolean isDebug() {
         // Make sure you are using BuildConfig from your own application
         return BuildConfig.DEBUG;
     }

     protected List<ReactPackage> getPackages() {
         // Add additional packages you require here
         // No need to add RnnPackage and MainReactPackage
         return Arrays.<ReactPackage>asList(
            new ReactNativeConfigPackage(),
            new MainReactPackage(),
<<<<<<< HEAD
            new FastImageViewPackage(),
=======
            new ReactNativeOneSignalPackage(),
>>>>>>> 8ea8b9ba969a55e0c82998ae8e41df7e65de2c34
            new VectorIconsPackage()
         );
     }

     @Override
     public List<ReactPackage> createAdditionalReactPackages() {
         return getPackages();
     }

     @Override
public String getJSMainModuleName() {
    return "index";
}
 }