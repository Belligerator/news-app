import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants.
  static const double _vSpaceSmall = 13.0;
  static const double _vSpaceMedium = 24.0;
  static const double _vSpaceLarge = 60.0;

  // Vertical spacing constants.
  static const double _hSpaceSmall = 13.0;
  static const double _hSpaceMedium = 24.0;
  static const double _hSpaceLarge = 60.0;

  /// Returns a vertical space with height set to [_vSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_vSpaceSmall);
  }

  /// Returns a vertical space with height set to [_vSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_vSpaceMedium);
  }

  /// Returns a vertical space with height set to [_vSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_vSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_hSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_hSpaceSmall);
  }

  /// Returns a vertical space with height set to [_hSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_hSpaceMedium);
  }

  /// Returns a vertical space with height set to [_hSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_hSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
