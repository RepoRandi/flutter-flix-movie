import 'dart:math';

import 'package:flix_movie/domain/entities/movie_detail/movie_detail.dart';
import 'package:flix_movie/domain/entities/transaction/transaction.dart';
import 'package:flix_movie/presentation/misc/constants.dart';
import 'package:flix_movie/presentation/misc/methods.dart';
import 'package:flix_movie/presentation/pages/seat_booking_page/methods/legend.dart';
import 'package:flix_movie/presentation/pages/seat_booking_page/methods/movie_screen.dart';
import 'package:flix_movie/presentation/pages/seat_booking_page/methods/seat_section.dart';
import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flix_movie/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_movie/presentation/widgets/seat.dart';
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
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];

  @override
  void initState() {
    super.initState();

    Random random = Random();
    int reservedNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(reservedNumber)) {
        reservedSeats.add(reservedNumber);
      }
      reservedNumber = random.nextInt(36) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                BackNavigationBar(
                  movieDetail.title,
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                movieScreen(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 1),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusCheker,
                    ),
                    horizontalSpace(30),
                    seatSection(
                      seatNumbers: List.generate(18, (index) => index + 19),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusCheker,
                    ),
                  ],
                ),
                verticalSpace(20),
                legend(),
                verticalSpace(40),
                Text(
                  '${selectedSeats.length} seat selected',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                verticalSpace(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onSeatTap(seatNumber) {
    if (!selectedSeats.contains(seatNumber)) {
      setState(() {
        selectedSeats.add(seatNumber);
      });
    } else {
      setState(() {
        selectedSeats.remove(seatNumber);
      });
    }
  }

  SeatStatus seatStatusCheker(seatNumber) {
    if (reservedSeats.contains(seatNumber)) {
      return SeatStatus.reserved;
    } else if (selectedSeats.contains(seatNumber)) {
      return SeatStatus.selected;
    } else {
      return SeatStatus.available;
    }
  }
}
