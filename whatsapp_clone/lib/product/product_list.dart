import 'package:flutter/material.dart';
import 'package:whatsapp_clone/product/product_item.dart';
import 'package:whatsapp_clone/product/product_model.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);

  List<ProductListModel> productList = [
    ProductListModel(
        productImage:
            'https://cdn.shopify.com/s/files/1/0266/6276/4597/products/2050026766112_1.jpg?v=1632491444',
        name: 'HOPSCOTCH',
        description: 'Baby Boys Cotton Full Sleeves Tshirt',
        originalPrice: '600',
        discountPrice: '300',
        discountPercentage: '50% off',
        offerPrice: '200'),
    ProductListModel(
        productImage:
            'https://cdn.shopify.com/s/files/1/0266/6276/4597/products/2050026766112_1.jpg?v=1632491444',
        name: 'TEAM SPIRIT',
        description: 'Baby Boys Cotton Full Sleeves Tshirt',
        originalPrice: '600',
        discountPrice: '300',
        discountPercentage: '10% off',
        offerPrice: '200'),
    ProductListModel(
        productImage:
            'https://cdn.shopify.com/s/files/1/0266/6276/4597/products/100001_300870851_075_1.jpg?v=1634755324',
        name: 'KG TEAM SPIRIT',
        description: 'Baby Boys Cotton Full Sleeves Tshirt',
        originalPrice: '600',
        discountPrice: '300',
        discountPercentage: '20% off',
        offerPrice: '200'),
    ProductListModel(
        productImage:
            'https://img.tatacliq.com/images/i8/437Wx649H/MP000000013753004_437Wx649H_202207101915071.jpeg',
        name: 'INF FRIENDZ',
        description: 'Baby Boys Cotton Full Sleeves Tshirt',
        originalPrice: '600',
        discountPrice: '300',
        discountPercentage: '30% off',
        offerPrice: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 4),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                productData: productList[index],
              );
            }));
  }
}
