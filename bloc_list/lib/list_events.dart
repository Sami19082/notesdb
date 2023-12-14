
abstract class ListEvents {}

class AddMap extends ListEvents{
 Map<String,dynamic> newMap;
 AddMap({required this.newMap});
}


class FetchAllMap extends ListEvents{}


class Update extends ListEvents{
  Map<String,dynamic> UpdateMap;
  int index;
  Update({required this.UpdateMap,required this.index});
}


class Delete extends ListEvents{
  int index;
  Delete({required this.index});
}