import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/api_model/popular_api_model.dart';
import 'package:news_app/data_source/app_exceptions.dart';
import 'package:news_app/data_source/url.dart';
import '../../data_source/api_helper.dart';
part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  ApiHelper apiHelper;
  BusinessBloc({required this.apiHelper}) : super(BusinessInitialState()) {
    on<BusinessEventNews>((event, emit) async{
      emit(BusinessLoadingState());
      try{
        var rawdata = await apiHelper.getApi(Url.BUSINESS_API);
        var mainmodel = MainModel.fromjson(rawdata);
        emit(BusinessLoadedState(mainModel: mainmodel));
      }catch(e){
        emit(BusinessErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}
