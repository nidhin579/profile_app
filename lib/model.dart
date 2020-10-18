import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Model with ChangeNotifier{
  String name='Nidhin';
  int phone=123456;
  bool check=true;
  File _image;
  String path;
  String propic='images/pro.png';
  bool pic=false;
  File imported;
  String imagepath;



  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

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
    notifyListeners();
  }

  saveName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', value);
  }

  readNum() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt('phone')??0;
    value==0?phone=123456789:phone=value;
    notifyListeners();
  }

  saveNum(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('phone',value);
  }

  readPic() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('pic')??'';
    value==''?propic='images/pro.png':imagepath=value;
    if(value!='')
      {
        pic=true;
        saveStat(true);
      }
    notifyListeners();
  }

  savePic(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pic',value);
  }
  saveStat(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('stat',value);
  }

  readStat() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('stat')??false;
    value==false?pic=false:pic=value;
    notifyListeners();
  }


}