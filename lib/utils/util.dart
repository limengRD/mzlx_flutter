import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  // 获取本地存储
  static Future<String> getStorage(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }
  // 设置本地存储
  static Future<void> setStorage(String key, String val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, val);
  }
}