import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/video.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late final YoutubePlayerController _controller;
  bool _liked = false;
  bool _bookmarked = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.video.youtubeId,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            backgroundColor: colorScheme.surface,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.video.title, style: textTheme.titleMedium),
                const SizedBox(height: 6),
                Text(
                  widget.video.channelName,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.video.description, style: textTheme.bodyMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _VideoActionButton(
                      tooltip: 'Like',
                      icon: _liked
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      selected: _liked,
                      onPressed: () => setState(() => _liked = !_liked),
                    ),
                    const SizedBox(width: 8),
                    _VideoActionButton(
                      tooltip: 'Share',
                      icon: Icons.ios_share_rounded,
                      onPressed: () => _showShareMessage(context),
                    ),
                    const SizedBox(width: 8),
                    _VideoActionButton(
                      tooltip: 'Bookmark',
                      icon: _bookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      selected: _bookmarked,
                      onPressed: () =>
                          setState(() => _bookmarked = !_bookmarked),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showShareMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ready to share "${widget.video.title}"'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _VideoActionButton extends StatelessWidget {
  const _VideoActionButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    this.selected = false,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: tooltip,
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon: Icon(icon),
        color: selected ? colorScheme.primary : const Color(0xFFD7DDE8),
        style: IconButton.styleFrom(
          fixedSize: const Size(44, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: const Color(0xFF202838),
        ),
      ),
    );
  }
}
