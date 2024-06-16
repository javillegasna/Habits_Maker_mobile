import 'package:flutter/material.dart';
import 'package:habit_maker/src/features/sample_feature/sample_item_details_view.dart';
import 'package:habit_maker/src/features/sample_feature/sample_item_list_view.dart';
import 'package:habit_maker/src/features/settings/settings_controller.dart';
import 'package:habit_maker/src/features/settings/settings_view.dart';

class AppRouter {
  const AppRouter({
    required this.settingsController,
  });

  final SettingsController settingsController;

  MaterialPageRoute getRouter(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case SettingsView.routeName:
              return SettingsView(controller: settingsController);
            case SampleItemDetailsView.routeName:
              final args = SampleItemDetailsArgs.fromMap(
                routeSettings.arguments as Map,
              );
              return SampleItemDetailsView(id: args.id);
            case SampleItemListView.routeName:
            default:
              return const SampleItemListView();
          }
        });
  }
}
