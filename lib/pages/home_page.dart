import 'package:flutter/material.dart';

import '../data/video_repository.dart';
import '../models/video.dart';
import '../widgets/category_strip.dart';
import '../widgets/video_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VideoRepository _repository = const VideoRepository();
  late String _selectedCategory = _repository.categories.first;

  @override
  Widget build(BuildContext context) {
    final videos = _filteredVideos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Kino'),
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Search is ready for a future catalog API.'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
              child: Text(
                'A darkroom feed of trailers, shorts, interviews, and film craft.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CategoryStrip(
              categories: _repository.categories,
              selectedCategory: _selectedCategory,
              onSelected: (category) {
                setState(() => _selectedCategory = category);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            sliver: SliverList.separated(
              itemCount: videos.length,
              itemBuilder: (context, index) => VideoCard(video: videos[index]),
              separatorBuilder: (_, _) => const SizedBox(height: 18),
            ),
          ),
        ],
      ),
    );
  }

  List<Video> get _filteredVideos {
    if (_selectedCategory == 'Featured') {
      return _repository.videos;
    }

    final matchingVideos = _repository.videos
        .where((video) => video.category == _selectedCategory)
        .toList(growable: false);

    return matchingVideos.isEmpty ? _repository.videos : matchingVideos;
  }
}
