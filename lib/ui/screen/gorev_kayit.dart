import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:todoapp/ui/cubit/gorev_kayit_cubit.dart';


class GorevKayitSayfa extends StatefulWidget {
  const GorevKayitSayfa({Key? key}) : super(key: key);

  @override
  State<GorevKayitSayfa> createState() => _GorevKayitSayfaState();
}

class _GorevKayitSayfaState extends State<GorevKayitSayfa> {

  var grvAd=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Görev Listesine Dön", style: TextStyle(fontFamily: "Rowdi"),),
      backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              TextField(controller: grvAd,decoration: const InputDecoration(hintText: "Yeni bir görev tanımlayın"),),

              ElevatedButton(onPressed: (){
                context.read<GorevKayitCubit>().kaydet(grvAd.text);
              } ,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  child: const Text("Kaydet", style: TextStyle(fontFamily: "Rowdi"),))

            ],
          ),
        ),
      ),
    );
  }
}
