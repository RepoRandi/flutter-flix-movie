import 'package:flix_movie/domain/entities/movie_detail/movie_detail.dart';
import 'package:flix_movie/domain/entities/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeatBookungPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const SeatBookungPage({Key? key, required this.transactionDetail})
      : super(key: key);

  @override
  ConsumerState<SeatBookungPage> createState() => _SeatBookungPageState();
}

class _SeatBookungPageState extends ConsumerState<SeatBookungPage> {
  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;
    return Scaffold(
        body: Center(
      child: Text(transaction.toString()),
    ));
  }
}
