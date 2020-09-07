import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_cricket_flutter/components/ImageHandler.dart';

class GameLogic {
  int _cpuWkts;
  static int _playerWkts = 0;
  int _cpuRuns;
  int _playerRuns = 0;
  int playerHand;
  int cpuHand;

  void setWickets(int w) {
    _cpuWkts = _playerWkts = w;
  }

  void setHands(ImageHandler img) {
    playerHand = img.getPlayerhand();
    cpuHand = img.getCpuhand();
    checkHandBatting();
  }

  String getcpuWickets() {
    return _cpuWkts.toString();
  }

  String getcpuRuns() {
    return _cpuRuns.toString();
  }

  String getplayerWickets() {
    return _playerWkts.toString();
  }

  String getplayerRuns() {
    return _playerRuns.toString();
  }

  void checkHandBatting() {
    if (_playerWkts > 0) {
      if (playerHand != cpuHand)
        _playerRuns += playerHand;
      else {
        print('Fall of wkts=$_playerWkts');
        _playerWkts--;
      }
    }
  }

  void checkHandBowling() {
    if (playerHand != cpuHand)
      _cpuRuns += cpuHand;
    else
      _cpuWkts--;
  }
}
