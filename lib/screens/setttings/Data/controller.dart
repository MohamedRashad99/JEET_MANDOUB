import 'package:jeet/network/network.dart';
import 'package:jeet/screens/setttings/Data/conditionModel.dart';
class CondtionGetData{

  NetWork _netWork = NetWork();
  ConditionModel _conditionModel=ConditionModel();
  Future<ConditionModel>getConditionData ()async{

    var response = await _netWork.getData(url: "condtions",) ;
    if(response!=null){
      _conditionModel=ConditionModel.fromJson(response);
    }else{
      ConditionModel(msg: "success");
    }
    return _conditionModel;

  }



}