
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/api_model/popular_api_model.dart';
import 'package:news_app/data_source/app_exceptions.dart';
import 'package:news_app/data_source/url.dart';

import '../../data_source/api_helper.dart';

part 'wallstreet_event.dart';
part 'wallstreet_state.dart';

class WallstreetBloc extends Bloc<WallstreetEvent, WallstreetState> {
  ApiHelper apihelper;
  WallstreetBloc({required this.apihelper}) : super(WallstreetInitialState()) {
    on<WallstreetNewEvent>((event, emit)async {
      emit(WallstreetLoadingState());
      try{
        var rawdata = await apihelper.getApi(Url.WALL_STREET_API);
        var mainModel = MainModel.fromjson(rawdata);
        emit(WallstreetLoadedState(mainModel: mainModel));
      }catch(e){
        emit(WallstreetErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}
