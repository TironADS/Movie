import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/Movies/Movies_Api.dart';
import '../Repository/Model_CLass/MovieModel.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieApi movieApi = MovieApi();
  late MovieModel movieModel;

  MovieBloc() : super(MovieInitial()) {
    on<FetchMovie>((event, emit) async {
      emit(
        MovieBlocLoading(),
      );
      try {
        movieModel = await movieApi.getMovie();
        emit(MovieBlocLoaded());
        print(e);
      } catch (e) {
        emit(
          MovieBlocError(),
        );
      }
      // TODO: implement event handler
    });
  }
}
