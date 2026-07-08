import 'package:flutter/material.dart';
import '../widgets/video_timeline.dart';
import '../widgets/editor_controls.dart';

class EditorScreen extends StatefulWidget {
  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  bool isPlaying = false;
  double currentTime = 15.0;
  double totalDuration = 60.0;
  double volume = 0.8;
  bool isMuted = false;

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature: FFmpeg add karne ke baad chalega'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editor'),
        actions: [
          IconButton(
            icon: Icon(Icons.file_upload_outlined),
            onPressed: () => _showComingSoon('Import Video'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_outline, size: 80, color: Colors.grey[800]),
                  SizedBox(height: 16),
                  Text('Video Preview', style: TextStyle(color: Colors.grey, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Import button se video add karo', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ),
          ),
          VideoTimeline(
            currentTime: currentTime,
            totalDuration: totalDuration,
            onSeek: (v) => setState(() => currentTime = v),
          ),
          EditorControls(
            isPlaying: isPlaying,
            isMuted: isMuted,
            volume: volume,
            onPlayPause: () => setState(() => isPlaying = !isPlaying),
            onTrim: () => _showComingSoon('Trim'),
            onSplit: () => _showComingSoon('Split'),
            onDelete: () => _showComingSoon('Delete'),
            onRotate: () => _showComingSoon('Rotate'),
            onCrop: () => _showComingSoon('Crop'),
            onMute: () => setState(() => isMuted = !isMuted),
            onVolumeChanged: (v) => setState(() => volume = v),
          ),
        ],
      ),
    );
  }
}
