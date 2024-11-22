import 'package:demoproject/bloc/cart_bloc.dart';

import 'package:demoproject/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItemWidget extends StatelessWidget {
  final CartBloc cartBloc;
  final ProductModel productModel;
  const CardItemWidget(
      {super.key, required this.cartBloc, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Card(
        elevation: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(255, 255, 255, 1)),
          child: Column(
            children: [
              RichText(
                  text: const TextSpan(text: 'Your Cart-', children: [
                TextSpan(
                  text: '2 items',
                ),
              ])),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 8),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(232, 241, 252, 1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5.71,
                                    color: Color.fromRGBO(92, 99, 105, 0.15))
                              ],
                            ),
                            child: const Icon(Icons.card_giftcard_rounded)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productModel.productName,
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(41, 41, 41, 1)),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (productModel.count > 0) {
                                        context.read<CartBloc>().add(
                                            CartUpdateCountEvent(
                                                productModel: productModel,
                                                newCount:
                                                    productModel.count - 1));
                                      }
                                    },
                                    child: Container(
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.05,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(34, 108, 233, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..scale(0.6, 1.0)
                                            ..translate(2.5, -11.0),
                                          child: const Icon(
                                            Icons.minimize,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.029,
                                  ),
                                  Text(
                                    productModel.count
                                        .toString(), // Convert count to String
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            41, 41, 41, 1)),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.029,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          CartUpdateCountEvent(
                                              productModel: productModel,
                                              newCount:
                                                  productModel.count + 1));
                                    },
                                    child: Container(
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.05,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(34, 108, 233, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..scale(0.6, 1.0)
                                            ..translate(2.5, -11.0),
                                          child: const Icon(
                                            Icons.minimize,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(CartRemoveEvent(
                                productitemId: productModel.id));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: screenHeight * 0.03,
                              width: screenWidth * 0.05,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 83, 41, 1),
                                shape: BoxShape.circle,
                              ),
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..scale(0.5, 0.5)
                                  ..translate(6.0, 6.0),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              productModel.price
                                  .toString(), // Convert price to String
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color.fromRGBO(34, 108, 233, 1)),
                            )),
                      ],
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
