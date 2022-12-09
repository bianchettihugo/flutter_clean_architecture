class TapValidator {

  DateTime? _clickTime;

  bool isRedundentClick(DateTime currentTime){
    if(_clickTime==null){
      _clickTime = currentTime;
      return false;
    }
    
    if(currentTime.difference(_clickTime!).inMilliseconds<500){
      return true;
    }

    _clickTime = currentTime;
    return false;
  }
}