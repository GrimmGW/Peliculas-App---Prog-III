import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_providers.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

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
            CardSwiper(movie: moviesProvider.onDisplayMovies,),
            //crear deslizar pelis con Row()
            MovieSlider(
              movie: moviesProvider.popularMovies,
              title: 'Peliculas populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      )
    );
  }
}