import 'package:flutter/material.dart';

class VideoTimeline extends StatelessWidget {
  final double currentTime;
  final double totalDuration;
  final Function(double) onSeek;

  const VideoTimeline({
    required this.currentTime,
    required this.totalDuration,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
      color: Color(0xFF1F1F1F),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatTime(currentTime), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Text(_formatTime(totalDuration), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
            ),
            child: Slider(
              value: currentTime,
              min: 0,
              max: totalDuration,
              onChanged: onSeek,
              activeColor: Colors.redAccent,
              inactiveColor: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(double seconds) {
    int mins = (seconds / 60).floor();
    int secs = (seconds % 60).floor();
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
