import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class Nextpage extends StatelessWidget {
  const Nextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Operation page"),),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CounterCubit>().increamentCount();context.read<CounterCubit>().increamentCount();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 150,),
          FloatingActionButton(
            onPressed: (){
            BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
