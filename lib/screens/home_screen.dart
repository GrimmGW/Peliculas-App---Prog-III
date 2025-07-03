import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            //crear deslizar pelis con Swiper()
            CardSwiper(),
            //crear deslizar pelis con Row()
            MovieSlider(),
          ],
        ),
      )
    );
  }
}