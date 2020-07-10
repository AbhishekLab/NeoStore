abstract class PPresenter{
  void getProduct(String productId);
}

abstract class ProductView{
  void error(String msg);
  void fetchAllProduct(String msg);
}