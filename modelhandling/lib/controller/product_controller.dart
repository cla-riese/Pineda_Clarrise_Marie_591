import 'package:modelhandling/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class ProductController {
  final supabase = Supabase.instance.client;
  
  Future<List<Product>> getProduct() async {
    final data = await supabase.from('products').select();
    return data.map((item) => Product.fromMap(item)).toList();
  }

  Future<void> addProduct(Product product) async {
    await supabase.from('products').insert(product.toMap());
  }


  Future<void> deleteProduct(int id) async {
    await supabase.from('products').delete().eq('id', id);
  }
  //calculate grand total

    double calculateGrandTotal(List<Product> product){
      double total = 0;
      for (var product in product) {
        total += product.price * product.quantity;
      }
      return total;
    }
    // total items

    int countTotalItems(List<Product> product) {
      int count = 0;
      for (var product in product) {
        count += product.quantity;
      }
      return count;
    }
}

