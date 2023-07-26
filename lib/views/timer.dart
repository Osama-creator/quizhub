import 'package:flutter/material.dart';
import 'package:quizhub/config/theme.dart';

class CountdownTimer extends StatefulWidget {
  final int durationInMinutes; // Duration in minutes
  final VoidCallback onTimerEnd; // Callback function for when the timer ends

  const CountdownTimer({
    required this.durationInMinutes,
    required this.onTimerEnd,
  });

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int _durationInSeconds; // Duration in seconds

  @override
  void initState() {
    super.initState();

    _durationInSeconds = widget.durationInMinutes * 60;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _durationInSeconds),
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
    _animationController.forward(from: 0.0).whenComplete(() {
      // Trigger the onTimerEnd callback when the timer ends
      widget.onTimerEnd();
    });
  }

  String _formatDuration() {
    final int remainingSeconds = (_durationInSeconds * _animation.value).ceil();
    final int minutes = remainingSeconds ~/ 60;
    final int seconds = remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatDuration(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14.0),
          ),
          Container(
            height: 10.0,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: MediaQuery.of(context).size.width * 0.8 * _animation.value,
          ),
        ],
      ),
    );
  }
}
