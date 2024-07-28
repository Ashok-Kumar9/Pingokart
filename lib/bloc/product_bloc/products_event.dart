abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  final String? category;
  FetchProducts({this.category});
}
