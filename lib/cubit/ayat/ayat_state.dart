part of 'ayat_cubit.dart';

abstract class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

class AyatInitial extends AyatState {}

class AyatLoading extends AyatState {}

class AyatLoaded extends AyatState {
  final SuratDetailModel detail;

  AyatLoaded(this.detail);

  @override
  // TODO: implement props
  List<Object> get props => [detail];
}

class AyatError extends AyatState {
  final String message;

  AyatError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
