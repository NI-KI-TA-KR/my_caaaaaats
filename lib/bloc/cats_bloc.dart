import 'package:cat_app/locator.dart';
import 'package:cat_app/models/cat.dart';
import 'package:cat_app/services/cats_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState>{
  CatsBloc() : super(CatsLoadingState());

  final service = sl<CatsService>();

  @override
  Stream<CatsState> mapEventToState (CatsEvent event) async* {
    switch(event){
      case CatsEvent.loading: 
        yield CatsLoadingState();
        final CatsResponse response = await service.getCats();
        if(!response.isSuccessful)
          yield CatsErrorState(errorMessage: response.errorMessage!);
        else if(response.cats!.isNotEmpty)
          yield CatsLoadedState(cats: response.cats!);
        else yield CatsEmptyState();
     }
  }
  
}

enum CatsEvent{loading,}

abstract class CatsState{}

class CatsLoadingState extends CatsState{}

class CatsLoadedState extends CatsState{
  CatsLoadedState({required this.cats});
  final List<Cat> cats;
}

class CatsEmptyState extends CatsState{}

class CatsErrorState extends CatsState{
  CatsErrorState({required this.errorMessage});
  final String errorMessage;
}