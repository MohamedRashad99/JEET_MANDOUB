import 'package:jeet/network/network.dart';
import 'package:jeet/screens/vehicleSelection/Data/carModel.dart';

class CarController{

  NetWork netWork = NetWork();
  CarModel carModel = CarModel();

  Future<CarModel>getCarData ()async{
    var response = await netWork.getData(url: "cars",) ;
    if(response!=null){
      carModel=CarModel.fromJson(response);
    //  print(response);
    }else{
      CarModel(msg: "success");
    }
    return carModel;

  }

}