import 'package:expenseapp_bloc/app_constants/iamge_constant.dart';

import '../Models/cato_model.dart';

class AppConstants {
  static final List<CategoryModel> mCategories = [
    CategoryModel(
        catID: 1,
        catTitle: "Travel",
        catImagePath: ImageConstants.IMG_PATH_TRAVEL),
    CategoryModel(
        catID: 2,
        catTitle: "Coffee",
        catImagePath: ImageConstants.IMG_PATH_COFFEE),
    CategoryModel(
        catID: 3,
        catTitle: "Fast_Food",
        catImagePath: ImageConstants.IMG_PATH_SNACK),
    CategoryModel(
        catID: 4,
        catTitle: "Make_Up",
        catImagePath: ImageConstants.IMG_PATH_MAKEUP),
    CategoryModel(
        catID: 5,
        catTitle: "Music",
        catImagePath: ImageConstants.IMG_PATH_MUSIC),
    CategoryModel(
        catID: 6,
        catTitle: "Restaurant",
        catImagePath: ImageConstants.IMG_PATH_RESTAURANT),
    CategoryModel(
        catID: 7,
        catTitle: "Gift_Box",
        catImagePath: ImageConstants.IMG_PATH_GIFT),
    CategoryModel(
        catID: 8,
        catTitle: "SmartPhone",
        catImagePath: ImageConstants.IMG_PATH_MOBILE),
    CategoryModel(
        catID: 9,
        catTitle: "Snacks",
        catImagePath: ImageConstants.IMG_PATH_POPCORN),
    CategoryModel(
        catID: 10,
        catTitle: "Shopping",
        catImagePath: ImageConstants.IMG_PATH_SHOPPING_BAG),
    CategoryModel(
        catID: 11,
        catTitle: "Watch",
        catImagePath: ImageConstants.IMG_PATH_WATCH),
    CategoryModel(
        catID: 12,
        catTitle: "Tools",
        catImagePath: ImageConstants.IMG_PATH_TOOLS),
    CategoryModel(
        catID: 13,
        catTitle: "vehicle",
        catImagePath: ImageConstants.IMG_PATH_VEHICALS),
    CategoryModel(
        catID: 14,
        catTitle: "vegetables",
        catImagePath: ImageConstants.IMG_PATH_VEGETABLES),
    CategoryModel(
        catID: 14,
        catTitle: "hot-pot",
        catImagePath: ImageConstants.IMG_PATH_HOT_POT),
  ];
}
