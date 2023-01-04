import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'playback/bloc/bloc.dart';
import 'providers/providers.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO ValueNotifierについて調査
  // [Flutter-Point] ValueNotifierは状態管理のテクニックらしい。
  final settings = ValueNotifier(ThemeSettings(
    // Replace this color
    sourceColor: Colors.pink,
    // [Flutter-Point] ThemeModeには他に light, dark がある。
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    // TODO [Package-Point] flutter-blocとは？
    return BlocProvider<PlaybackBloc>(
      create: (context) => PlaybackBloc(),
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                // Create theme instance
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  // Add theme
                  // Add dark theme
                  // Add theme mode
                  routeInformationParser: appRouter.routeInformationParser,
                  routeInformationProvider: appRouter.routeInformationProvider,
                  routerDelegate: appRouter.routerDelegate,
                  builder: (context, child) {
                    return PlayPauseListener(child: child!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
