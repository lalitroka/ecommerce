import 'package:demoproject/bloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demoproject/bloc/product_bloc.dart';
import 'package:demoproject/models/product/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductBloc productBloc;
  final ProductModel productModel;

  const ProductItemWidget(
      {super.key, required this.productBloc, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void showFullDialog(var title, var content) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'))
                ],
              ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        productBloc.add(
                            ProductCartedEvent(clickProduct: productModel));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.95,
                              color: Color.fromRGBO(92, 99, 105, 0.15),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.card_giftcard_rounded),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => showFullDialog(
                            'Product Name', productModel.productName),
                        child: Text(
                          productModel.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(41, 41, 41, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.07,
              ),
              // Right Side: Price and Quantity
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(111, 217, 67, 1),
                        ),
                        child: GestureDetector(
                          onTap: () => showFullDialog(
                              'Price',
                              productModel.price
                                  .toString()), // Convert price to string
                          child: Text(
                            productModel.price
                                .toString(), // Convert price to string
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(34, 108, 233, 1),
                        ),
                        child: GestureDetector(
                          onTap: () => showFullDialog(
                              'Quantity',
                              productModel.quantity
                                  .toString()), // Convert quantity to string
                          child: Text(
                            productModel.quantity
                                .toString(), // Convert quantity to string
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
