import 'package:alquran_app/data/api_service.dart';
import 'package:alquran_app/data/models/surat_detail_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  final ApiService apiService;
  AyatCubit(this.apiService) : super(AyatInitial());

  void getDetailSurat(int noSurat) async {
    emit(AyatLoading());

    final result = await apiService.getDetailSurat(noSurat);

    result.fold(
      (error) => emit(AyatError(error)),
      (data) => emit(AyatLoaded(data)),
    );
  }
}
