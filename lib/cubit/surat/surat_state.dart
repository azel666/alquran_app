part of 'surat_cubit.dart';

abstract class SuratState extends Equatable {
  const SuratState();

  @override
  List<Object> get props => [];
}

class SuratInitial extends SuratState {}

class SuratLoading extends SuratState {}

class SuratLoaded extends SuratState {
  final List<SuratModel> listSurat;

  SuratLoaded(this.listSurat);

  @override
  // TODO: implement props
  List<Object> get props => [listSurat];
}

class SuratError extends SuratState {
  final String message;

  SuratError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
