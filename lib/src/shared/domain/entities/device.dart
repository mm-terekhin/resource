enum Device {
  mobile,
  tablet;

  bool get isMobile => this == mobile;

  bool get isTablet => this == tablet;
}
