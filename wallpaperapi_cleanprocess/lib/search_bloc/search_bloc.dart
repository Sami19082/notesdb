import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaperapi_cleanprocess/models/api_model.dart';
import '../data_source/api_helper.dart';
import '../data_source/app_exception.dart';
import '../data_source/urls.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ApiHelper apiHelper;
  SearchBloc({required this.apiHelper}) : super(SearchInitialState()) {
    on<SearchWall>((event, emit)async{
      emit(SearchLoadingState());

      try{
        var rawData = await apiHelper.getAPI("${Urls.SEARCH_WALLPAPER}?query=${event.query}");
        var wallpaperModel = WallpaperDataModel.fromJson(rawData);
        emit(SearchLoadedState(mData: wallpaperModel));
      }catch(e){
        emit(SearchErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
  }
