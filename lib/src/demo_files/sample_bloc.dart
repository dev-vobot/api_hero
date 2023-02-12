import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sample_item_model.dart';
import 'sample_repository.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final SampleRepository _sampleRepository;
  SampleBloc(this._sampleRepository) : super(SampleInitial()) {
    on<FetchSample>((event, emit) async {
      emit(SampleProgress());
      try {
        final Response<SampleModel> response = await _sampleRepository.fetchSample();
        if (response.statusCode == 200) {
          if (response.body != null) {
            emit(SampleSuccess(samples: response.body!.data));
          } else {
            emit(SampleSuccess(samples: []));
          }
        } else {
          debugPrint("Non 200 response \n ${response.statusCode}");
          emit(SampleFailure());
        }
      } catch (e) {
        debugPrint("Error from API \n $e");
        emit(SampleFailure());
      }
    });
  }
}

//states instantiation
abstract class SampleState {}

//events instantiation
abstract class SampleEvent {}

//states implementation
class SampleInitial extends SampleState {}

class SampleProgress extends SampleState {}

class SampleSuccess extends SampleState {
  final List<Datum> samples;

  SampleSuccess({required this.samples});
}

class SampleFailure extends SampleState {}

//events implementation
class FetchSample extends SampleEvent {}
