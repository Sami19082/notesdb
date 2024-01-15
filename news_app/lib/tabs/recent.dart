import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/tech_bloc/tech_bloc.dart';
import '../data_source/api_helper.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  late ApiHelper apiHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<TechBloc,TechState>(
          builder: (context,state){
            if(state is TechLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is TechErrorState){
              return Text(state.errorMsg);
            }else if(state is TechLoadedState){
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
                            child: Center(child: Text(state.mainModel.articles![index].title!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                        leading: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image: NetworkImage("${state.mainModel.articles![index].urlToImage}"),fit: BoxFit.cover)
                          ),
                        ),
                        subtitle: Text(state.mainModel.articles![index].publishedAt!,style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 12,color: Colors.white),),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text("NO DATA FOUND!!!",style: TextStyle(color: Colors.white),),);
          }),
    );
  }
}
