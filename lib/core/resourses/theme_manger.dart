import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zomorod/core/extensions/color.dart';
import 'package:zomorod/core/extensions/num.dart';
import 'color_manger.dart';
import 'font_manger.dart';
import 'sizes_manager.dart';
import 'styles_manger.dart';

///This app defines the Light  and Dark themes of the Suiiz app
///please change the theme with this way `EasyDynamicTheme.of(context).changeTheme();`
///if you want to know if the dark mode  is enabled check with this way => ``` bool isDarkModeOn = Theme.of(context).brightness == Brightness.dark; ```
class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,

    primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),

    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.transparent.getMaterialColorFromColor(),
        accentColor: ColorsManager.accent,
        backgroundColor: ColorsManager.white,
        brightness: Brightness.light,
        cardColor: ColorsManager.white,
        errorColor: ColorsManager.error),
    //main colors of the app
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.primary,
    dialogBackgroundColor: Colors.white,

    primaryColorLight: ColorsManager.primary,
    disabledColor: ColorsManager.lightGrey,

    splashColor: Colors.transparent,
    fontFamily: FontNames.fontName,
    //card theme for the cards
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: Sizes.size4,
      margin: const EdgeInsets.all(Margins.xSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        enableFeedback: true,
        backgroundColor: ColorsManager.primary,
        elevation: 8,
        shape: CircleBorder()),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.black),
      backgroundColor: ColorsManager.white,
      shadowColor: ColorsManager.black,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: StylesManager.regular(
          color: ColorsManager.black, fontSize: FontSize.large),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsManager.primary,
      disabledColor: ColorsManager.lightGrey,
      splashColor: ColorsManager.primary,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        textStyle: StylesManager.bold(
          color: ColorsManager.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.primary,
        selectedItemColor: ColorsManager.accent,
        showSelectedLabels: true,
        unselectedItemColor: ColorsManager.grey,
        selectedLabelStyle: StylesManager.regular(
            color: ColorsManager.accent, fontSize: FontSize.xXSmall),
        unselectedLabelStyle: StylesManager.regular(
            color: ColorsManager.grey, fontSize: FontSize.xSmall)),
    textTheme: TextTheme(
      displayLarge: StylesManager.medium(
          color: ColorsManager.darkGrey,
          fontSize: Sizes.size18.getContextFontSize),
      titleMedium: StylesManager.medium(
          color: ColorsManager.darkGrey,
          fontSize: Sizes.size16.getContextFontSize),
      titleSmall: StylesManager.medium(
          color: ColorsManager.darkGrey,
          fontSize: Sizes.size14.getContextFontSize),
      bodySmall: StylesManager.regular(
        color: ColorsManager.lightGrey,
      ),
      bodyLarge: StylesManager.regular(color: ColorsManager.grey),
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: ColorsManager.red,
    ),

    tabBarTheme: const TabBarTheme(
        indicatorColor: ColorsManager.primary,
        labelColor: ColorsManager.primary,
        unselectedLabelColor: ColorsManager.lightGrey),

    inputDecorationTheme: InputDecorationTheme(
      //border

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: ColorsManager.lightGrey,
        ),
      ),
      //hint text style
      hintStyle: StylesManager.regular(color: ColorsManager.lightGrey),
      //focused ERROR border
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.lightGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.lightGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.white,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),

      suffixStyle: StylesManager.medium(color: ColorsManager.grey),
      focusColor: ColorsManager.success,
      //focused ERROR hint text style
      errorStyle: StylesManager.regular(color: ColorsManager.error),
      //focused Label text style
      labelStyle: StylesManager.medium(color: ColorsManager.grey),
      filled: true,
      fillColor: Colors.white,

      ///fill COLOR
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Paddings.xLarge,
        horizontal: Paddings.large,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.transparent.getMaterialColorFromColor(),
        accentColor: ColorsManager.accent,
        backgroundColor: ColorsManager.black,
        brightness: Brightness.dark,
        cardColor: ColorsManager.black,
        errorColor: ColorsManager.error,
      ),
      scaffoldBackgroundColor: ColorsManager.black,
      dialogBackgroundColor: ColorsManager.darkGrey,
      primaryColorLight: ColorsManager.primary,
      disabledColor: ColorsManager.lightGrey,
      tabBarTheme: const TabBarTheme(
          indicatorColor: ColorsManager.white,
          labelColor: ColorsManager.white,
          unselectedLabelColor: ColorsManager.darkGrey),
      splashColor: Colors.transparent,
      fontFamily: FontNames.fontName,
      cardTheme: CardTheme(
        color: ColorsManager.black,
        shadowColor: ColorsManager.grey,
        elevation: Sizes.size4,
        margin: const EdgeInsets.all(Margins.xSmall),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          enableFeedback: true,
          backgroundColor: ColorsManager.primary,
          elevation: 8,
          shape: CircleBorder()),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: ColorsManager.white),
        backgroundColor: ColorsManager.charcoal,
        shadowColor: ColorsManager.charcoal,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: StylesManager.regular(
            color: ColorsManager.white, fontSize: FontSize.large),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: ColorsManager.primary,
        disabledColor: ColorsManager.lightGrey,
        splashColor: ColorsManager.primary,
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          textStyle: StylesManager.bold(
            color: ColorsManager.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.primary,
          selectedItemColor: ColorsManager.accent,
          showSelectedLabels: true,
          unselectedItemColor: ColorsManager.grey,
          selectedLabelStyle: StylesManager.regular(
              color: ColorsManager.accent, fontSize: FontSize.xXSmall),
          unselectedLabelStyle: StylesManager.regular(
              color: ColorsManager.grey, fontSize: FontSize.xSmall)),
      textTheme: TextTheme(
        displayLarge: StylesManager.medium(
          color: Colors.white,
          fontSize: Sizes.size18.getContextFontSize,
        ),
        titleMedium: StylesManager.medium(
          color: Colors.white,
          fontSize: Sizes.size16.getContextFontSize,
        ),
        titleSmall: StylesManager.medium(
          color: Colors.white,
          fontSize: Sizes.size14.getContextFontSize,
        ),
        bodySmall: StylesManager.regular(
          color: ColorsManager.lightGrey,
        ),
        bodyLarge: StylesManager.regular(
          color: Colors.white,
        ),
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: ColorsManager.red,
      ),
      inputDecorationTheme: InputDecorationTheme(
        //border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        //hint text style
        hintStyle: StylesManager.regular(color: ColorsManager.lightGrey),
        //focused ERROR border
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),

        suffixStyle: StylesManager.medium(color: Colors.white),
        focusColor: ColorsManager.success,
        //focused ERROR hint text style
        errorStyle: StylesManager.regular(color: Colors.white),
        //focused Label text style
        labelStyle: StylesManager.medium(color: ColorsManager.grey),
        filled: true,
        fillColor: ColorsManager.darkGrey,

        ///fill COLOR
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: Paddings.xLarge,
          horizontal: Paddings.large,
        ),
      ));
}
