# Flutter's default rules to keep critical engine classes
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Google Play
-dontwarn com.google.android.play.core.**

# Your custom rules to protect the HttpOverrideService and related classes
-keep class ca.isaacoram.isaacs_simple_media_mobile.** { *; }
-keep class java.security.cert.X509Certificate