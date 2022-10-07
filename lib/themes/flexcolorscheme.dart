import 'package:riverpoduniversity/all_imports.dart';

//I FREAKING LOVE FLEXCOLORSCHEME! I use it in
//every single app and @RydMike should be knighted
//for his work.
ThemeData themeLight = FlexThemeData.light(
  scheme: FlexScheme.outerSpace,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 26,
  appBarOpacity: 0.85,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
    unselectedToggleIsColored: true,
    dialogBackgroundSchemeColor: SchemeColor.background,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.questrial().fontFamily,
);
ThemeData themeDark = FlexThemeData.dark(
  scheme: FlexScheme.outerSpace,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
    unselectedToggleIsColored: true,
    dialogBackgroundSchemeColor: SchemeColor.background,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.questrial().fontFamily,
);
