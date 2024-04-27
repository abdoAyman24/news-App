import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/botton_nav/entertainment.dart';
import 'package:news_app/view/botton_nav/health.dart';
import 'package:news_app/view/botton_nav/science.dart';

// ignore: must_be_immutable
class homePage extends GetWidget {
  @override
  newsController controller = Get.put(newsController());
  List<Widget> screen = [
    entertainment(),
    science(),
    health(),
  ];

  homePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('news App'),
        ),
        bottomNavigationBar: GetX<newsController>(
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.currentIndex.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                label: 'entertainment',
                icon: Icon(Icons.sports),
              ),
              BottomNavigationBarItem(
                label: 'science',
                icon: Icon(Icons.science),
              ),
              BottomNavigationBarItem(
                label: 'health',
                icon: Icon(Icons.health_and_safety_outlined),
              ),
            ],
          ),
        ),
        body: GetX<newsController>(
            builder: (controller) => screen[controller.currentIndex.value]));
  }
}
