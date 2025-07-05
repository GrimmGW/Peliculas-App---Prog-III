import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/themes/app_theme.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movie;

  const CardSwiper({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(movie.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5 ,
        child: Center(
          child: CircularProgressIndicator(color: AppTheme.primary,),
        ),
      );

    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5 ,
      //color temporal
      // color: Colors.red,
      child: Swiper(
        itemCount: movie.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6 ,
        itemHeight: size.height *0.4,
        itemBuilder: ( context, index ){
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie[index]) ,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('${ movie[index].fullPosterImg }'),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      ),
    );
  }
}
