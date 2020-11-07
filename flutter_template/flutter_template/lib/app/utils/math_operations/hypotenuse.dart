import 'dart:math';

import 'package:flutter/foundation.dart';

double getHypotenuse({@required double width, @required double height}) {
  return sqrt(pow(width, 2) + pow(height, 2));
}
