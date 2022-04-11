import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'src_state.dart';

class SrcCubit extends Cubit<SrcState> {
  SrcCubit() : super(SrcInitial());
}
