/// Internal constants for the Garden UI library.
///
/// These constants are used internally by the library components and should NOT
/// be accessed by external projects using the library.
/// They are not exported in the public API.
class InternalConstants {
  // Private constructor to prevent instantiation
  InternalConstants._();

  // Icon sizes for different component sizes
  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 20.0;
  static const double iconSizeLg = 24.0;

  // Menu widths for different menu sizes
  static const double menuWidthSm = 200.0;
  static const double menuWidthMd = 300.0;
  static const double menuWidthLg = 400.0;

  // Logo widths for different sizes
  static const double logoWidthSm = 96.0;
  static const double logoWidthMd = 156.0;
  static const double logoWidthLg = 256.0;

  // Hierarchical menu indentation per level
  static const double hierarchicalIndentPerLevel = 16.0;
}
