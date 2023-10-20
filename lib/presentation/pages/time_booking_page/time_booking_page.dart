import 'package:flix_movie/domain/entities/movie_detail/movie_detail.dart';
import 'package:flix_movie/presentation/widgets/selectable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;

  const TimeBookingPage(this.movieDetail, {Key? key}) : super(key: key);

  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: SelectableCard(
            text: 'XXI Botanica',
            isEnable: false,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
