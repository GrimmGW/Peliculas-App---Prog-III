import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
      ),
      body: Column(
        children: [

          //todo: crear deslizar pelis con Swiper()
          CardSwiper()
          //todo: crear deslizar pelis con Row()

        ],
      )
    );
  }
}