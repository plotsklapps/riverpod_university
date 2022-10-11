import 'package:riverpoduniversity/all_imports.dart';

//Create a provider that returns a ThemeData of type
//FlexThemeData, that in turn watches the themeColorProvider
//to set the color to the chosen color
final themeLightProvider = StateProvider<ThemeData>((ref) {
  return FlexThemeData.light(
    //Can be found in themecolor_provider.dart
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

//Create a provider that returns a ThemeData of type
//FlexThemeData, that in turn watches the themeColorProvider
//to set the color to the chosen color
final themeDarkProvider = StateProvider<ThemeData>((ref) {
  return FlexThemeData.dark(
    //Can be found in themecolor_provider.dart
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