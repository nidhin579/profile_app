import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Model with ChangeNotifier{
  String name='Nidhin';
  int phone=123456;
  bool check=true;
  File _image;
  String path;
  String propic='images/pro.png';
  bool pic=false;
  File imported;



  void update(String n,int p){
    name=n;
    phone=p;
    saveNum(p);
    saveName(n);
    notifyListeners();

  }
  Future<void> imagepick() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
        _image = image;
        imported=_image;
    });
    path = _image.path;
      propic = path;
      savePic(path);

  }

  readName() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('name')??'';
    value==''?name='Nidhin':name=value;
  }

  saveName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', value);
  }

  readNum() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt('phone')??0;
    value==0?phone=123456789:phone=value;
  }

  saveNum(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('phone',value);
  }

  readPic() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('pic')??'';
    value==''?propic='images/pro.png':propic=value;
    if(value!='')
      {
        pic=true;
      }
  }

  savePic(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pic',value);
  }

}