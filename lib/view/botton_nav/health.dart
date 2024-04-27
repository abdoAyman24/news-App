import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_modle.dart';

// ignore: must_be_immutable
class health extends GetWidget {
  @override
  newsController controller = Get.put(newsController());

  health({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData('health'),
        builder: (context, AsyncSnapshot snapshot) {
          Welcome? data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                //use content to identifier length
                itemCount: data!.articles.length,
                itemBuilder: (context, int index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: Image.network(
                            data.articles[index].urlToImage.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          data.articles[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.articles[index].description.toString(),
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
