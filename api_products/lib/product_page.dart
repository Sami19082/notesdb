import 'package:flutter/material.dart';

import 'datamodel.dart';

class ProductDetailPage extends StatelessWidget {
ProductModel thisProduct;

  ProductDetailPage({required this.thisProduct});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${thisProduct.title}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: thisProduct.images!.length,
                itemBuilder: (context,index){
              return Image.network(thisProduct.images![index]);
            })
          ),
          Text(thisProduct.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          Text("Price :\$ ${thisProduct.price!}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text(thisProduct.description!,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),),
          Text("Rating:${thisProduct.rating.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        ],
      ),
    );
  }
}
