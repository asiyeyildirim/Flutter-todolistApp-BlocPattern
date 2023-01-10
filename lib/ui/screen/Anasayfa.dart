import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/entity/isler.dart';
import 'package:todoapp/ui/cubit/anasayfa_cubit.dart';
import 'package:todoapp/ui/screen/gorev_detay.dart';
import 'package:todoapp/ui/screen/gorev_kayit.dart';



class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().isleriYukle();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        titleTextStyle: TextStyle(fontFamily: "Rowdi", fontWeight: FontWeight.bold, fontSize: 18),
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Görev Ara",
        hintStyle: TextStyle(color: Colors.white70)

        ),onChanged: (aramaSonucu){
          context.read<AnasayfaCubit>().ara(aramaSonucu);
        },) :
        const Text("To Do List"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {aramaYapiliyorMu = false;});
            context.read<AnasayfaCubit>().isleriYukle();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {aramaYapiliyorMu = true;});
          }, icon: const Icon(Icons.search)),
        ],
      ),

      body: BlocBuilder<AnasayfaCubit,List<Isler>>(
        builder: (context, islerListesi){
          if(islerListesi.isNotEmpty){
            return ListView.builder(itemCount:islerListesi.length,
                itemBuilder: (context,indeks){
              var gorev = islerListesi[indeks];

              return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GorevDetaySayfa(gorev: gorev))).then((value) =>
                    {context.read<AnasayfaCubit>().isleriYukle()});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey, width: 4),borderRadius: BorderRadius.circular(5.0),),
                  child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${gorev.gorev_name}", style: TextStyle(fontFamily:"Rowdi", fontSize: 15),),

                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${gorev.gorev_name} silinsin mi?"),
                          action: SnackBarAction(
                            label: "Evet",
                            onPressed: (){
                              context.read<AnasayfaCubit>().sil(gorev.gorev_id);
                            },
                          ),
                        ),
                      );

                    }, icon: const Icon(Icons.delete_outline, color: Colors.black54,))
                  ],
                  ),
                  ),
                  );
                });
          }
          else{
            return const Center();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> GorevKayitSayfa())).then((value) => {context.read<AnasayfaCubit>().isleriYukle()});

        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple
      ),

    );
  }
}
