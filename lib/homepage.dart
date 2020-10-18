import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:profile_app/editpage.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 20),
      body: Consumer<Model>(builder: (context, myModel, child){
        myModel.readName();
        myModel.readNum();
        myModel.readPic();
        myModel.readStat();


          return SafeArea(
            child: Container(

          child: Column(
            children: <Widget>[
              Expanded(
                child: NeuCard(
                  decoration: NeumorphicDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  bevel: 20,
                  curveType: CurveType.concave,
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, EditPage.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(228, 226, 244, 100)
                                      .withOpacity(.5),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              width: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/settings.png',
                                    width: 15,
                                    height: 15,
                                  ),
                                  Text(
                                    'Edit ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(79, 32, 149, 100)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Consumer<Model>(builder: (context, myModel, child) {
                          return Container(
                            width: 140,
                            height: 140,
                            child: Hero(
                                tag: 'pro',
                                child: myModel.pic!=true?CircleAvatar(
                                  backgroundImage:myModel.pic?FileImage(myModel.imported): AssetImage(myModel.propic),
                                  radius: 135,
                                  backgroundColor: Colors.black,
                                ):CircleAvatar(radius: 135,backgroundColor: Colors.black,backgroundImage: FileImage(File(myModel.imagepath)),)),
                        );}
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Align(alignment: Alignment.bottomLeft,child: Padding(
                          padding: const EdgeInsets.only(left:45.0),
                          child: Text('NAME :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        )),
                        Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Center(
                            child: Consumer<Model>(builder: (context, myModel, child){
                              return Text(
                                myModel.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    ),
                              );}
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Align(alignment: Alignment.bottomLeft,child: Padding(
                          padding: const EdgeInsets.only(left:45.0),
                          child: Text('PHONE NO. :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        )),
                        Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(18))),
                          child: Center(
                            child: Consumer<Model>(builder: (context, myModel, child) {
                              return Text(
                                myModel.phone.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,

                                ),
                              );
                            }),
                        ),),

                      ],
                    ),
                  ),
                ),

              ),
            ],
          ),
        ));}
      ),
    );
  }
}
