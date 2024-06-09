import 'package:equatable/equatable.dart';

sealed class ProcessStatus extends Equatable {}

class ProcessStatusInitial extends ProcessStatus {
  @override
  List<Object?> get props => [];
}

class ProcessStatusLoading extends ProcessStatus {
  @override
  List<Object?> get props => [];
}

class ProcessStatusSuccess extends ProcessStatus {
  @override
  List<Object?> get props => [];
}

class ProcessStatusFailure extends ProcessStatus {
  @override
  List<Object?> get props => [];
}
