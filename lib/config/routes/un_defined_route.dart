import 'package:chat/config/resources/app_strings.dart';
import 'package:flutter/material.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.someThingWentWrong),
      ),
      body: const Center(
        child: Text('قم باعادة تشغيل التطبيق'),
      ),
    ),
  );
}
