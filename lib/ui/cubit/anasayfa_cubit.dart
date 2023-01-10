import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/entity/isler.dart';
import 'package:todoapp/repo/isler_repo.dart';


class AnasayfaCubit extends Cubit<List<Isler>>{
  AnasayfaCubit() : super(<Isler>[]);

  var irepo = IslerRepository();

  Future<void>isleriYukle() async{
    var liste = await irepo.isleriYukle();
    emit(liste);

  }
  Future<void> sil(int gorev_id) async{
    await irepo.sil(gorev_id);
    await isleriYukle();// arayüze yeni hali yüklenmesi için
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await irepo.ara(aramaKelimesi);
    emit(liste);
  }


}