enum DeviceType { mobile, tablet, desktop }

class ScreenUtils {
  static const double mobileMaxSize = 640;
  static const double tabletMaxSize = 1008;
  static const double desktopMinSize = 1008;

  static DeviceType getDeviceType(double width) {
    if (width <= mobileMaxSize) {
      return DeviceType.mobile;
    } else if (width > mobileMaxSize && width <= tabletMaxSize) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}
