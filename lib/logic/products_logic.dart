import 'package:pharmax/database/app_database.dart';
import 'package:pharmax/models/product_model.dart';

class ProductsLogic {
  final AppDatabase db;
  ProductsLogic(this.db);

  Future<List<ProductModel>> fetchAll() async {
    final data = await db.productsDao.getAllProducts();
    return data.map((item) {
      return ProductModel.fromDrift(
        item.product,
        item.barcodes,
      );
    }).toList();
  }

  Future<void> insert(ProductModel model) async {
    final companion = model.toCompanion();
    await db.productsDao.insertProduct(companion, model.barcodes);
  }

  Future<void> update(int id, ProductModel model) async {
    final companion = model.toCompanion();
    await db.productsDao.updateProduct(id, companion, model.barcodes);
  }

  Future<void> delete(int id) async {
    await db.productsDao.deleteProduct(id);
  }
}
