import 'package:jeet/network/network.dart';
import 'package:jeet/screens/home/Data/profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileGetData{
  NetWork _netWork = NetWork();
  ProfileModel _profileModel =ProfileModel();
  Future<ProfileModel>getProfileData ()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("البروفايل " + preferences.getString("token"),);
    var response = await _netWork.getData(url: "deliveryprofile",headers:{
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':'Bearer '+ preferences.getString("token"),
    }
    ) ;
    if(response!=null){
      _profileModel=ProfileModel.fromJson(response);
       print(response);
    }else{
      ProfileModel(msg: "success");
    }
    return _profileModel;

  }


}

