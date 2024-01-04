import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/BloC/movie_bloc.dart';
import 'package:movies/Repository/Model_CLass/MovieModel.dart';
import 'package:movies/UI/page1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late MovieModel data;

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(FetchMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000153),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieBlocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieBlocError) {
              return Center(child: Text('something else !!'));
            }
            if (state is MovieBlocLoaded) {
              data = BlocProvider.of<MovieBloc>(context).movieModel;
              return ListView.separated(
                  itemBuilder: (BuildContext, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Page1(
                              img: data.movies![index].backdropPath.toString(),
                              title: data.movies![index].title.toString(),
                              gen: data.movies![index].genres.toString(),
                              overview: data.movies![index].overview.toString(),
                              date: data.movies![index].firstAired.toString(),
                              post: data.movies![index].posterPath.toString(),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.network(
                            data.movies![index].posterPath.toString(),
                            height: 100,
                            width: 70,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 220,
                                  child: Text(
                                    data.movies![index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffce1a)),
                                  )),
                              SizedBox(
                                width: 220,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Geners :  ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        data.movies![index].genres.toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: data.movies!.length);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
