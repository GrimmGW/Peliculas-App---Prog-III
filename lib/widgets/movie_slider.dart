import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Peliculas populares', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            )),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 130,
                  margin: EdgeInsets.all(10),
                  height: 200,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details'),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage('https://dummyimage.com/300x400.png'),
                            height: 175,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      Text('Lilo y Stitch',
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