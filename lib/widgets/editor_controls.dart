import 'package:flutter/material.dart';

class EditorControls extends StatelessWidget {
  final bool isPlaying;
  final bool isMuted;
  final double volume;
  final VoidCallback onPlayPause;
  final VoidCallback onTrim;
  final VoidCallback onSplit;
  final VoidCallback onDelete;
  final VoidCallback onRotate;
  final VoidCallback onCrop;
  final VoidCallback onMute;
  final Function(double) onVolumeChanged;

  const EditorControls({
    required this.isPlaying,
    required this.isMuted,
    required this.volume,
    required this.onPlayPause,
    required this.onTrim,
    required this.onSplit,
    required this.onDelete,
    required this.onRotate,
    required this.onCrop,
    required this.onMute,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFF1F1F1F),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled, size: 45),
                onPressed: onPlayPause,
                color: Colors.redAccent,
              ),
              IconButton(
                icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                onPressed: onMute,
              ),
              Expanded(
                child: Slider(
                  value: isMuted ? 0 : volume,
                  onChanged: onVolumeChanged,
                  activeColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(height: 1),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _tool(Icons.cut, 'Trim', onTrim),
              _tool(Icons.content_cut, 'Split', onSplit),
              _tool(Icons.delete_outline, 'Delete', onDelete),
              _tool(Icons.rotate_right, 'Rotate', onRotate),
              _tool(Icons.crop, 'Crop', onCrop),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tool(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
