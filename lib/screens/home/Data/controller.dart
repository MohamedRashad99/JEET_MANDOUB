import 'package:jeet/network/network.dart';
import 'package:jeet/screens/home/Data/bannerModel.dart';


class BannersGetData{
  NetWork _netWork = NetWork();
  BannerModel _bannerModel =BannerModel();
  Future<BannerModel>getBannersData ()async{

    var response = await _netWork.getData(url: "banners",) ;
    if(response!=null){
      _bannerModel=BannerModel.fromJson(response);
     // print(response);
    }else{
      BannerModel(msg: "success");
    }
    return _bannerModel;

  }


}