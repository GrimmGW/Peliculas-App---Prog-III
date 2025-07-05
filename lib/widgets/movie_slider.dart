import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatefulWidget {

  final String? title;
  final List<Movie> movie;
  final Function onNextPage;

  const MovieSlider({
    super.key, 
    this.title, 
    required this.movie, 
    required this.onNextPage
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener((){

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        print('Llegando al final');
        widget.onNextPage();
      }

    });

  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title!, style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            )),
          ) : Container() ,
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movie.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 130,
                  margin: EdgeInsets.all(10),
                  height: 200,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: widget.movie[index]),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage('${ widget.movie[index].fullPosterImg }'),
                            height: 175,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      Text(widget.movie[index].title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}