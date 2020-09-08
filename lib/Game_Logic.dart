import 'package:hand_cricket_flutter/components/ImageHandler.dart';

class GameLogic {
  static int _cpuWkts;
  static int _playerWkts = 0;
  static int _cpuRuns=0;
  static int _playerRuns = 0;
  int playerHand;
  int cpuHand;

  void setWickets(int w) {
    _cpuWkts = _playerWkts = w;
  }

  void setHands(ImageHandler img) {
    playerHand = img.getPlayerhand();
    cpuHand = img.getCpuhand();
  }

  int getScoreDiff() {
    return _playerRuns - _cpuRuns;
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
      else
        _playerWkts--;
    }
  }

  void checkHandBowling() {
    if (_cpuWkts > 0 || getScoreDiff() > 0) {
      if (playerHand != cpuHand)
        _cpuRuns += cpuHand;
      else
        _cpuWkts--;
    }
  }
}
