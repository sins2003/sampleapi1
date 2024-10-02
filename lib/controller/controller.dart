import 'package:get/get.dart';
import '../services/dioservice.dart';

class TableControllerclass extends GetxController {
  var itemlList = [].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;


  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    try {
      isLoading(true);
      errorMessage('');
      final items = await Dioservice().getItems();
      itemlList.assignAll(items);
    } catch (e) {
      errorMessage('Failed to load items');
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}