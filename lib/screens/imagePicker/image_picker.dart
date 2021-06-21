import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:jeet/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/generated/locale_keys.g.dart';

class TakeImage{
   static getImage(BuildContext context , ImageSource src) async {
    final pickedFile = await ImagePicker.platform.pickImage(source: src);
      print(pickedFile.path);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        Navigator.of(context).pop(image);
      } else {
        print('NO Image Select');
      }
  }
  static Future<File> imageFile(ctx)async{
   /* return await showDialog(context: ctx, builder:(ctx)=> AlertDialog(
      title: Text(LocaleKeys.imageCantBeEmpty.tr(),style: TextStyle(fontFamily: "dinnextl medium",color: kTextColor.withOpacity(0.5),fontSize: 18),textAlign:TextAlign.center ,),
      content: Container(
        decoration: BoxDecoration(color: kHomeColor,borderRadius: BorderRadius.circular(8)),
        height: 150,
        child: Column(
          children: [
            Divider(
              color: Colors.black,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(color: kTextColor,borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(LocaleKeys.gallery.tr()),
                leading: Icon(Icons.image),
                onTap: () async{
                  await getImage(ctx,ImageSource.gallery);

                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(color: kTextColor,borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(LocaleKeys.camera.tr()),
                leading: Icon(Icons.add_a_photo),
                onTap: () async{
                  await getImage(ctx,ImageSource.camera);

                },
              ),
            ),
          ],
        ),
      ),
    ));*/
    return await  showModalBottomSheet(context: ctx, builder: (_){
      return Container(
        height: MediaQuery.of(ctx).size.height*0.2,
        width: MediaQuery.of(ctx).size.width,
        decoration: BoxDecoration(color: kBackgroundColor,borderRadius:BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)) ),
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(LocaleKeys.gallery.tr(),style: TextStyle(fontFamily: "dinnextl bold",color: Colors.black),),
                  leading: Icon(Icons.image,color: kPrimaryColor,),
                  onTap: () async{
                    await getImage(ctx,ImageSource.gallery);

                  },
                ),
                ListTile(
                  title: Text(LocaleKeys.camera.tr(),style: TextStyle(fontFamily: "dinnextl bold",color: Colors.black)),
                  leading: Icon(Icons.add_a_photo,color: kPrimaryColor,),
                  onTap: () async{
                    await getImage(ctx,ImageSource.camera);

                  },
                ),
              ],),
          ),
        ),
      );
    },);

  }


}
