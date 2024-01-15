import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/api_model/popular_api_model.dart';
import 'package:news_app/data_source/app_exceptions.dart';
import 'package:news_app/data_source/url.dart';
import '../../data_source/api_helper.dart';
part 'tech_event.dart';
part 'tech_state.dart';

class TechBloc extends Bloc<TechEvent, TechState> {
  ApiHelper apiHelper;
  TechBloc({required this.apiHelper}) : super(TechInitialState()) {
    on<TechEventNews>((event, emit) async{
      emit(TechLoadingState());
      try{
        var rawdata = await apiHelper.getApi(Url.TECH_API);
        var mainmodel = MainModel.fromjson(rawdata);
        emit(TechLoadedState(mainModel: mainmodel));
      }catch(e){
        emit(TechErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}
