import 'package:flutter/material.dart';

extension ASSET on String {
  toPNG() {
    return "assets/images/$this.png";
  }
}

extension SPACER on num {
  SizedBox get vSpace {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox get hSpace {
    return SizedBox(
      width: toDouble(),
    );
  }
}
