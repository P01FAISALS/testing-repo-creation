package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.{{ cookiecutter.project_name|replace(' ', '') }}AndroidPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android, za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.{{ cookiecutter.project_name|replace(' ', '') }}AndroidPlugin", e);
    }
  }
}
