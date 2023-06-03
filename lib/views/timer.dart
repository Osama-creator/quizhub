import 'package:flutter/material.dart';
import 'package:quizhub/config/theme.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;

  const CountdownTimer({required this.duration});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _startTimer();
  }

  void _startTimer() {
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${(widget.duration * _animation.value).ceil()} ',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24.0),
        ),
        Container(
          height: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: MediaQuery.of(context).size.width * _animation.value,
        ),
      ],
    );
  }
}
