package com.coinmarketnews;

// import com.facebook.react.ReactActivity;

// public class MainActivity extends ReactActivity {

//     /**
//      * Returns the name of the main component registered from JavaScript.
//      * This is used to schedule rendering of the component.
//      */
//     @Override
//     protected String getMainComponentName() {
//         return "CoinMarketNews";
//     }
// }
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.graphics.Color;
import android.view.Gravity;
import android.util.TypedValue;

 import com.reactnativenavigation.controllers.SplashActivity;

 public class MainActivity extends SplashActivity {
    @Override
    public LinearLayout createSplashLayout() {
        LinearLayout splash = new LinearLayout(this);
        LinearLayout textBox = new LinearLayout(this);
        TextView textView = new TextView(this);
        Drawable launch_screen_bitmap = ContextCompat.getDrawable(getApplicationContext(),R.drawable.launch_screen_bitmap);

        textView.setTextColor(Color.parseColor("#F8F8F8"));
        textView.setText("CoinMarketNews");
        textView.setGravity(Gravity.CENTER);
        // textView.setLineHeight(30);
        textView.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 28);

        textBox.addView(textView);

        // textBox.setGravity(Gravity.CENTER_HORIZONTAL);        

        splash.setGravity(Gravity.BOTTOM | Gravity.CENTER );
        splash.setBackground(launch_screen_bitmap);
        splash.addView(textBox);

        return splash;
    }
 }