import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaperapi_cleanprocess/data_source/app_exception.dart';
import 'package:wallpaperapi_cleanprocess/data_source/urls.dart';
import 'package:wallpaperapi_cleanprocess/models/api_model.dart';
import '../data_source/api_helper.dart';
part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<WallpaperEvent>((event, emit) async{
      emit(WallpaperLoadingState());
      try{
        var rawdata = await apiHelper.getAPI(Urls.TRENDING_WALLPAPER);
        var wallpaperModel = WallpaperDataModel.fromJson(rawdata);
        emit(WallpaperLoadedState(mData: wallpaperModel));
      } catch (e){
        emit(WallpaperErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
}}
