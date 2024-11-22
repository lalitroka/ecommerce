import 'package:demoproject/bloc/product_bloc.dart';
import 'package:demoproject/bloc/product_event.dart';
import 'package:demoproject/bloc/product_state.dart';
import 'package:demoproject/view/dashboard/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ProductBloc productBloc = ProductBloc();
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    productBloc.add(ProductInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listener: (context, state) {
        if (state is ProductCartedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('prduct Carted')));
        }
      },
      listenWhen: (previoud, current) => current is ProductActionState,
      buildWhen: (previous, current) => current is! ProductActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductLoadingState:
            return SizedBox(
              height: screenHeight * 8,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case ProductLoadSuccessState:
            final successState = state as ProductLoadSuccessState;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('All Categories',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: SearchBar(
                        controller: _searchController,
                        onChanged: (query) {
                          productBloc.add(ProductSearchEvent(query: query));
                        },
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                        leading: const Icon(Icons.search),
                        hintText: 'Search Product',
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(232, 241, 252, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(10),
                                topStart: Radius.circular(10)),
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        height: screenHeight,
                        child: ListView.builder(
                          itemCount: successState.products.length,
                          itemBuilder: (context, index) {
                            return ProductItemWidget(
                              productBloc: productBloc,
                              productModel: successState.products[index],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );

          case ProdcutErrorState:
            return SizedBox(
              height: screenHeight * 8,
              child: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox(
              height: screenHeight,
            );
        }
      },
    );
  }
}
