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
      if (items != null) {
        itemlList.value = items;
      }
      itemlList.assignAll(items);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}