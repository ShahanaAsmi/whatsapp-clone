import 'package:flutter/material.dart';
import 'package:whatsapp_clone/product/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.productData}) : super(key: key);

  final ProductListModel productData;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Image.network(productData.productImage!)),
          const SizedBox(height: 10.0),
          Text(
            productData.name!,
            // textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          Text(
            productData.description!,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Icon(
                Icons.currency_rupee,
                size: 12,
              ),
              Text(
                productData.originalPrice!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.currency_rupee,
                color: Colors.grey,
                size: 12,
              ),
              Text(
                productData.discountPrice!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(width: 5),
              Text(
                productData.discountPercentage!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Icon(Icons.percent, size: 12, color: Colors.blue),
              const SizedBox(
                width: 5,
              ),
              // const Text(
              //   'Offer Price',
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12,
              //       color: Colors.green),
              // ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'offer price is ${productData.offerPrice!}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
