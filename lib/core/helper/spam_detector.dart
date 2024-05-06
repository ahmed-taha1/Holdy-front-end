import 'package:accounts_protector/core/errors/spam_failure.dart';

class SpamDetector{
  static final Map<String, int> _spamMap = {};
  static const int _maxFailTimes = 5;
  static const Duration _blockDuration = Duration(minutes: 5);
  static final Map<String, DateTime> _blockMap = {};

  static void addFailure(String process){
    if(_spamMap.containsKey(process)) {
      _spamMap[process] = _spamMap[process]! + 1;
    } else {
      _spamMap[process] = 1;
    }
  }

  static void isSpam(String process) {
    if (_spamMap.containsKey(process) && _spamMap[process]! >= _maxFailTimes) {
      if (!_blockMap.containsKey(process)) {
        _blockMap[process] = DateTime.now().add(_blockDuration);
      }
      if (DateTime.now().isAfter(_blockMap[process]!)) {
        clearSpam(process);
      }
      throw SpamFailure(message: 'spam detected you have to wait ${_blockDuration.inMinutes} minutes to retry');
    }
  }

  static void clearSpam(String process) {
    _spamMap.remove(process);
    _blockMap.remove(process);
  }
}