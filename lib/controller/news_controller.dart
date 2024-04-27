import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_modle.dart';

class newsController extends GetxController {
  RxInt currentIndex = 0.obs;

  getData(String cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=${cat}&apiKey=01bc9a489f3f41109a621e67488120d4");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return Welcome.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('error', e.toString(),
            duration: const Duration(seconds: 100));
      }
    }
  }
}
