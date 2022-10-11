import 'package:riverpoduniversity/all_imports.dart';

final themeLightProvider = StateProvider<ThemeData>((ref) {
  return FlexThemeData.light(
    scheme: ref.watch(themeColorProvider),
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    blendLevel: 24,
    appBarOpacity: 0.00,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 24,
      thinBorderWidth: 2.0,
      unselectedToggleIsColored: true,
      inputDecoratorRadius: 24.0,
      chipRadius: 24.0,
      dialogBackgroundSchemeColor: SchemeColor.background,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.questrial().fontFamily,
  );
});

final themeDarkProvider = StateProvider<ThemeData>((ref) {
  return FlexThemeData.dark(
    scheme: ref.watch(themeColorProvider),
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    blendLevel: 24,
    appBarOpacity: 0.00,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 24,
      thinBorderWidth: 2.0,
      unselectedToggleIsColored: true,
      inputDecoratorRadius: 24.0,
      chipRadius: 24.0,
      dialogBackgroundSchemeColor: SchemeColor.background,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.questrial().fontFamily,
  );
});
