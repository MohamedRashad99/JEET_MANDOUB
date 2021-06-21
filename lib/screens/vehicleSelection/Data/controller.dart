import 'package:jeet/network/network.dart';
import 'package:jeet/screens/vehicleSelection/Data/model.dart';
class GetCarController{
  NetWork _netWork = NetWork();
  SelectCarModel _selectCarModel = SelectCarModel();


  Future<SelectCarModel> GetCars()async{
    var response = await _netWork.getData(url: 'cars',);
    _selectCarModel = SelectCarModel.fromJson(response);
    print("${response}pppppppppppppppppp");
    return _selectCarModel;
  }
}