import 'package:todoapp/data/entity/isler.dart';
import 'dart:core';
import 'package:todoapp/data/sqlite/veritabani.dart';


class IslerRepository{
  Future<void> kaydet(String gorev_name) async{

    var db = await Veritabani.veritabaniErisim();
    var gorevler = Map<String, dynamic>();
    gorevler ["gorev_name"] = gorev_name;
    await db.insert("todolist", gorevler);

  }

  Future<void> guncelle(int gorev_id, String gorev_name) async{
    var db = await Veritabani.veritabaniErisim();

    var gorevler = Map<String,dynamic>();
    gorevler ["gorev_name"] = gorev_name;

    await db.update("todolist", gorevler, where: "gorev_id = ?", whereArgs: [gorev_id]);

  }

  Future<List<Isler>>isleriYukle() async {
    var db = await Veritabani.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("Select * from todolist");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Isler(gorev_id: satir["gorev_id"], gorev_name: satir["gorev_name"]);
    });

  }



  //Arama İşlemi:

  Future<List<Isler>> ara(String aranacakGorev) async {


    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from todolist Where gorev_name like '%$aranacakGorev%'");
    return List.generate(maps.length, (i)  {
      var satir = maps[i];
      return Isler(gorev_id: satir["gorev_id"], gorev_name: satir["gorev_name"]);
    });


  }





  Future<void> sil(int gorev_id) async{

    var db = await Veritabani.veritabaniErisim();
    await db.delete("todolist", where:"gorev_id= ?", whereArgs: [gorev_id]);

  }
}