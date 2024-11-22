import 'package:demoproject/bloc/cart_bloc.dart';
import 'package:demoproject/models/card/card_item.dart';
import 'package:demoproject/view/dashboard/widget/card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  CartBloc cartBlocA = CartBloc();
  @override
  void initState() {
    cartBlocA.add(CartInitialEvent());
    super.initState();
  }

  double calculateTotal() {
    return cartListItem.fold(0, (sum, item) => (sum + item.count * item.price));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CartBloc()..add(CartInitialEvent()),
      child: BlocConsumer(
        bloc: cartBlocA,
        listenWhen: (previous, current) => current is CartErrorState,
        listener: (context, state) {
          if (state is CartErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state as String)),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 3),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.keyboard_return,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(10),
                              topStart: Radius.circular(10)),
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      height: screenHeight,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: successState.cartListItems.length,
                          itemBuilder: (context, index) {
                            return CardItemWidget(
                                cartBloc: cartBlocA,
                                productModel:
                                    successState.cartListItems[index]);
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 40),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 17),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(232, 241, 252, 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total - ',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(41, 41, 41, 0.45)),
                              ),
                              Text('INR ${calculateTotal()}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color:
                                          const Color.fromRGBO(41, 41, 41, 1)))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 40),
                          child: FilledButton.icon(
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(34, 108, 233, 1)),
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 90, vertical: 7))),
                            onPressed: () {},
                            icon: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(Icons.card_giftcard_rounded,
                                    size: 16,
                                    color: Color.fromRGBO(34, 108, 233, 1))),
                            label: Text(
                              'Checkout',
                              style: GoogleFonts.poppins(
                                fontSize: 17.42,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              );

            case CartErrorState:
              final errorMessage = state as CartErrorState;
              return Center(
                child: Text('Error : $errorMessage'),
              );

            default:
              return Container(
                child: Center(
                  child: Text('Error'),
                ),
              );
          }
        },
      ),
    );
  }
}
