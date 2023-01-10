import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/entity/isler.dart';

import '../cubit/gorev_detay_cubit.dart';


class GorevDetaySayfa extends StatefulWidget {

  Isler gorev;
  GorevDetaySayfa({required this.gorev});

  @override

  State<GorevDetaySayfa> createState() => _GorevDetaySayfaState();
}

class _GorevDetaySayfaState extends State<GorevDetaySayfa> {

  var grvAd=TextEditingController();


  @override
  void initState() {
    super.initState();
    var gorev = widget.gorev;
    grvAd.text = gorev.gorev_name;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Görev Detay", style: TextStyle(fontFamily: "Rowdi"),),
      backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              TextField(controller: grvAd,decoration: const InputDecoration(hintText: "Görev Ad"),),

              ElevatedButton(onPressed: (){
                context.read<GorevDetayCubit>().guncelle(widget.gorev.gorev_id/*id değişmesin diye*/, grvAd.text);
              } ,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,),
                  child: const Text("Güncelle",style: TextStyle(fontFamily: "Rowdi"),),),


            ],
          ),
        ),
      ),
    );
  }
}
