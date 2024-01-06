import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pasar_petani/app/shared/theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        theme: themeData,
        getPages: AppPages.routes,
      ),
    ),
  );
}
