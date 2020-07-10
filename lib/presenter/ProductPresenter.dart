import 'dart:convert';

import 'package:neostore/contract/product_contract.dart';
import 'package:neostore/model/product_model.dart';
import 'package:neostore/network/ApiHelper.dart';

class ProductPresenter extends PPresenter {
  ProductView view;

  ProductPresenter(ProductView view) {
    this.view = view;
  }

  @override
  void getProduct(String productId) {

    var productRequestData = ProductRequest.generateMap(productId, 10, 1);
    getResponse(productRequestData).then((onValue){


      switch(onValue.statusCode){
        case 200: {
          var response = ProductList.fromJson(jsonDecode(onValue.toString()));
          print(response);
          break;
        }
        default: {
          print("no no no");
        }
      }
    });

    view.fetchAllProduct(productId);
  }
}
