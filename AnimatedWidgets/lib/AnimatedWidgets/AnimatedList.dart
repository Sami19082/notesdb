import 'package:flutter/material.dart';

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({Key? key}) : super (key:key);

  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  final items = [];

  void addItem() {
    items.insert(0, 'item ${items.length + 1}');
    key.currentState!.insertItem(
      0,
      duration: Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    key.currentState!.removeItem(index, duration: Duration(microseconds: 300),
            (context, animation) =>
            SizeTransition(
              sizeFactor: animation,
              child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text("Deleted", style: TextStyle(fontSize: 24),),
                ),
              ),
            ));
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: IconButton(
            onPressed: addItem,
            icon: Icon(Icons.add,size: 25,),
          ),
        ),
        Expanded(
          child: AnimatedList(
            key: key,
            initialItemCount: 0,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(key: UniqueKey(), sizeFactor: animation,
                  child: Card(margin: EdgeInsets.all(10),
                      color: Colors.orangeAccent,
                      child: ListTile(
                          title: Text(
                            items[index],
                            style: TextStyle(fontSize: 24),
                          ), trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removeItem(index);
                          }))));
            },
          ),
        ),
      ],
    );
  }


}
