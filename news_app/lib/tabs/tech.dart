import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data_source/api_helper.dart';

import '../blocs/newsbloc_bloc.dart';

class Tech extends StatefulWidget {
  const Tech({super.key});

  @override
  State<Tech> createState() => _TechState();
}

class _TechState extends State<Tech> {
  late ApiHelper apiHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: BlocBuilder<NewsblocBloc, NewsblocState>(
          builder: (context, state) {
            if (state is NewsblocLoadingState) {
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is NewsblocErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            } else if (state is NewsblocLoadedState) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.mainModel.articles!.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white24,
                      ),
                      child: ListTile(
                        title: SizedBox(
                          width: 300,
                            height: 100,
                            child: Center(child: Text(state.mainModel.articles![index].title!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                        leading: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(image: NetworkImage("${state.mainModel.articles![index].urlToImage}"),fit: BoxFit.cover)
                          ),
                        ),
                        subtitle: Text(state.mainModel.articles![index].publishedAt!,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12,color: Colors.white),),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: Text("NO DATA FOUND!!!"),);
          },
        ),
      ));
  }
}
