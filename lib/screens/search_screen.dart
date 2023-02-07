import 'package:ecommarceassign/model/search_product_model.dart';
import 'package:ecommarceassign/service/product_search_api.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Products> searchProductList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void didChangeDependencies()async {

    super.didChangeDependencies();
    searchProductList = await ProductSearchApi().fetchApiData();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 242, 255,1),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(height: 70,),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: (){},icon: Icon(Icons.search,color: Colors.black12,),

              ),
              filled: true,
              fillColor: Color.fromRGBO(255, 255, 255, 1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.transparent)
              )
            ),
          ),
          SizedBox(height: 20,),

          ListView.builder(
            shrinkWrap: true,
              itemCount: searchProductList.length,
              itemBuilder: (context,index){
            return Container(
              child: Text("${searchProductList[index].results![0].brand!.name}"),
            );
          })
        ],),
      ),
    );
  }
}
