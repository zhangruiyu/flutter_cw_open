import 'package:chongmeng/function/movie/movie_cinema/model/cinema_movies_entity.dart';
import 'package:chongmeng/function/movie/movie_seat/model/movie_order_entity.dart';
import 'package:chongmeng/function/movie/movie_seat/model/seat_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class MovieOrderPreState implements Cloneable<MovieOrderPreState> {
  //场次信息
  CinemaMoviesShowdataMoviesShowsPlist cinemaMovie;

  //电影信息
  CinemaMoviesShowdataMovie selectCinemaMovie;

//电影信息加影院信息
  CinemaMoviesEntity cinemaMovies;

//座位信息
  SeatEntity seatEntity;

  //用户选择的座位
  List<SeatSeatdataSeatRegionsRowsSeat> localSelectMovie;
  MovieOrderData order;
  @override
  MovieOrderPreState clone() {
    return MovieOrderPreState()
      ..order = order
      ..cinemaMovies = cinemaMovies
      ..cinemaMovie = cinemaMovie
      ..seatEntity = seatEntity
      ..localSelectMovie = localSelectMovie;
  }
}

MovieOrderPreState initState(Map<String, dynamic> args) {
  return MovieOrderPreState()
    ..order = args['order']
    ..cinemaMovies = args['cinemaMovies']
    ..seatEntity = args['seatEntity']
    ..localSelectMovie = args['localSelectMovie']
    ..cinemaMovie = args['cinemaMovie']
    ..selectCinemaMovie = args['selectCinemaMovie'];
}
