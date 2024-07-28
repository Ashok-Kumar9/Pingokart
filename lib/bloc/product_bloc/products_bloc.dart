import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_event.dart';
import 'package:pingokart/bloc/product_bloc/products_state.dart';
import 'package:pingokart/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService;

  ProductBloc(this._productService) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products =
          await _productService.getProducts(category: event.category);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
