import 'package:alquran_app/data/api_service.dart';
import 'package:alquran_app/data/models/surat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit(this.apiService) : super(SuratInitial());

  final ApiService apiService;

  void getAllSurat() async {
    emit(SuratLoading());
    final result = await apiService.getAllSurat();

    result.fold(
      (error) => emit(SuratError(error)),
      (data) => emit(SuratLoaded(data)),
    );
  }
}
