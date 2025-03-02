part of 'widgets.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: Config.APP_NAME,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationHelper.navigatorKey,
          scaffoldMessengerKey: NavigationHelper.scaffoldKey,
          onGenerateRoute: NavigationHelper.generateRoute,
          initialRoute: AppRoute.HOME,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
