import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/isler_repo.dart';


class GorevDetayCubit extends Cubit<void>{

  GorevDetayCubit() : super(0);

  var irepo = IslerRepository();

  Future<void> guncelle(int gorev_id, String gorev_name) async{
    await irepo.guncelle(gorev_id, gorev_name);
  }
}