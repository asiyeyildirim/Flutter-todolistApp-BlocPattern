import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/isler_repo.dart';


class GorevKayitCubit extends Cubit <void>{
  GorevKayitCubit () : super (0);


  var irepo = IslerRepository();

  Future<void> kaydet(String gorev_name)  async {
    await  irepo.kaydet(gorev_name);
  }

}