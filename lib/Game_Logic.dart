import 'package:hand_cricket_flutter/components/ImageHandler.dart';

class GameLogic {
  static int _cpuWkts = 0;
  static int _playerWkts = 0;
  static int _cpuRuns = 0;
  static int _playerRuns = 0;
  static String _choice;
  int playerHand;
  int cpuHand;

  void setPLayerChoice(String s) {
    _choice = s;
  }

  void setWickets(int w) {
    _cpuWkts = _playerWkts = w;
  }

  void setHands(ImageHandler img) {
    playerHand = img.getPlayerhand();
    cpuHand = img.getCpuhand();
  }

  int getScoreDiff() {
    return _choice == 'bat' ? _playerRuns - _cpuRuns : _cpuRuns - _playerRuns;
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

  bool checkHandBatting() {
    //return true for fall of wickets
    if (_playerWkts > 0) {
      if (playerHand != cpuHand)
        _playerRuns += playerHand;
      else {
        _playerWkts--;
        return true;
      }
    }
    return false;
  }

  bool checkHandBowling() {
    if (_cpuWkts > 0) {
      if (playerHand != cpuHand) {
        _cpuRuns += cpuHand;
      } else {
        _cpuWkts--;
        return true;
      }
    }
    return false;
  }

  void reset() {
    _cpuWkts = 0;
    _playerWkts = 0;
    _cpuRuns = 0;
    _playerRuns = 0;
    _choice = "";
  }

  String getMatchResults() {
    if (_choice == 'bat') {
      //if player chose to bat first
      if (_playerRuns > _cpuRuns)
        return 'You won by ' + getScoreDiff().abs().toString() + ' runs!';
      else if (_playerRuns == _cpuRuns)
        return 'Match was a tie!';
      else
        return 'Cpu won by ' + getcpuWickets().toString() + ' wickets!';
    } else {
      // if player chose to bowl first
      if (_playerRuns < _cpuRuns)
        return 'Cpu won by ' + getScoreDiff().abs().toString() + ' runs!';
      else if (_playerRuns == _cpuRuns)
        return 'Match was a tie!';
      else
        return 'You won by ' + getplayerWickets().toString() + ' wicket(s)!';
    }
  }
}
