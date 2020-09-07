import 'package:flutter/material.dart';
import 'dart:math';

class ImageHandler {
  int _cpuhand = 1;
  int _playerhand = 4;

  int getCpuhand() {
    return _cpuhand;
  }

  int getPlayerhand() {
    return _playerhand;
  }

  void setHand(int imageno) {
    _playerhand = imageno;
    _cpuhand = new Random().nextInt(6) + 1;
  }
}