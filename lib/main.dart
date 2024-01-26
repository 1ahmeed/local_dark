import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled_localization/core/cache_helper.dart';
import 'package:untitled_localization/cubit/lang_cubit.dart';
import 'package:untitled_localization/home_screen.dart';

import 'block_observer.dart';
import 'core/theme/themes.dart';
import 'cubit/lang_state.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isArabic = CacheHelper.getData(key: "isArabic");
  bool? isDark = CacheHelper.getData(key: "isDark");
  // Bloc.observer = MyBlocObserver();

  runApp(MyApp(isArabic: isArabic,isDark: isDark,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isArabic, this.isDark});

  final bool? isArabic;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LangCubit()..changeLang(fromShared: isArabic)..changeMode(fromShared: isDark),
      child: BlocConsumer<LangCubit, LangState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner:false,
            theme:AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
             themeMode:LangCubit.get(context).isDark ?ThemeMode.light:ThemeMode.dark ,
            locale: LangCubit.get(context).isArabic
                ? const Locale("en")
                : const Locale("ar"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
