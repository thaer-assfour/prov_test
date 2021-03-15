import 'package:flutter/material.dart';
import 'package:prov_test/models/product.dart';

class CartProvider with ChangeNotifier {

  List<Product> productsCart = [];


  get getLength {
    if (productsCart.length == null)
      return 0;
    else
    return productsCart.length;
  }

  void addToCart(Product product) {
/*    var isExist = isProductExist(product);
    if (isExist == -1)
      productsCart.add(product);
    else
      productsCart[isExist].qty++;*/
    productsCart.add(product);
notifyListeners();
  }

  /*void removeFromCart(Product product) {
    var isExist = isProductExist(product);
    if (isExist != -1)
      productsCart.removeAt(isExist);
  }*/

 /* int isProductExist(Product product) {
    if (productsCart.length == null)
      return -1;
    else
    return productsCart.indexOf(product);
  }*/


}
