import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/api_model/popular_api_model.dart';
import 'package:news_app/data_source/api_helper.dart';
import 'package:news_app/data_source/app_exceptions.dart';
import 'package:news_app/data_source/url.dart';

part 'newsbloc_event.dart';
part 'newsbloc_state.dart';

class NewsblocBloc extends Bloc<NewsblocEvent, NewsblocState> {
  ApiHelper apiHelper;
  NewsblocBloc({required this.apiHelper}) : super(NewsblocInitialState()) {
    on<GetNewsEvent>((event, emit) async{
      emit(NewsblocLoadingState());
      try{
        var rawdata = await apiHelper.getApi(Url.API_KEY);
        var srcModels = MainModel.fromjson(rawdata);
        emit(NewsblocLoadedState(mainModel: srcModels));
      } catch(e){
        emit(NewsblocErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}
