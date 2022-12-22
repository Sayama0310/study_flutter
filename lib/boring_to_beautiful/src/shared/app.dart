import 'package:flutter/material.dart';
import 'package:study_flutter/boring_to_beautiful/src/shared/providers/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO ValueNotifierについて調査
  // [Point] 状態管理のテクニックらしい。
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink, // Replace this color
    themeMode: ThemeMode.system, // [Point] テーマモードには他に light, dark がある。
  ));

  @override
  Widget build(BuildContext context) {
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
