import 'package:jeet/network/network.dart';
import 'package:jeet/screens/personalInfo/Data/selectCityModel.dart';
class GetCityController{
  NetWork _netWork = NetWork();
  SelectCityModel _selectCityModel = SelectCityModel();


  Future<SelectCityModel> GetCity()async{

    var response = await _netWork.getData(url: 'cities',);
    _selectCityModel = SelectCityModel.fromJson(response);
    print("${_selectCityModel.data[0].name}dddddddddddddddddddd");
    return _selectCityModel;
  }
}