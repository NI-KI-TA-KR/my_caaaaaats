import 'package:cat_app/locator.dart';
import 'package:cat_app/models/cat.dart';
import 'package:cat_app/services/cats_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState>{
  CatsBloc() : super(CatsStateLoading());

  @override
  Stream<CatsState> mapEventToState (CatsEvent event) async* {
    switch(event){
      case CatsEvent.loading: 
        yield CatsStateLoading();
        final data = await sl<CatsService>().getCats();
        if(data.isNotEmpty)
          yield CatsStateLoaded(cats: data);
        else yield CatsStateEmpty();
     }
  }
  
}

 enum CatsEvent{loading,}

abstract class CatsState{}

class CatsStateLoading extends CatsState{}

class CatsStateLoaded extends CatsState{
  CatsStateLoaded({required this.cats});
  final List<Cat> cats;
}

class CatsStateEmpty extends CatsState{}