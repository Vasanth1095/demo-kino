import '../models/video.dart';

class VideoRepository {
  const VideoRepository();

  List<String> get categories => const [
    'Featured',
    'Trailers',
    'Short Films',
    'Interviews',
    'Behind the Scenes',
  ];

  List<Video> get videos => const [
    Video(
      youtubeId: 'YoHD9XEInc0',
      title: 'Inception - Official Trailer',
      channelName: 'Warner Bros. Pictures',
      description:
          'A sharp, dream-bending thriller trailer with grand scale and precise visual rhythm.',
      category: 'Featured',
    ),
    Video(
      youtubeId: 'zSWdZVtXT7E',
      title: 'Interstellar - Official Trailer',
      channelName: 'Warner Bros. Pictures',
      description:
          'A sweeping look at space, family, and survival from Christopher Nolan.',
      category: 'Trailers',
    ),
    Video(
      youtubeId: 'n9xhJrPXop4',
      title: 'Dune - Official Main Trailer',
      channelName: 'Warner Bros. Pictures',
      description:
          'Desert empires, prophecy, and massive sci-fi worldbuilding in a premium trailer.',
      category: 'Featured',
    ),
    Video(
      youtubeId: 'uYPbbksJxIg',
      title: 'Oppenheimer - Official Trailer',
      channelName: 'Universal Pictures',
      description:
          'A tense historical drama trailer built around ambition, consequence, and scale.',
      category: 'Trailers',
    ),
    Video(
      youtubeId: 'gCcx85zbxz4',
      title: 'Blade Runner 2049 - Official Trailer',
      channelName: 'Warner Bros. Pictures',
      description:
          'A neon-soaked glimpse into identity, memory, and futuristic noir atmosphere.',
      category: 'Featured',
    ),
    Video(
      youtubeId: '5PSNL1qE6VY',
      title: 'Avatar - Official Trailer',
      channelName: '20th Century Studios',
      description:
          'A lush first trip into Pandora with action, creatures, and immersive world design.',
      category: 'Trailers',
    ),
    Video(
      youtubeId: 'ex3C1-5Dhb8',
      title: 'The Creator - Official Trailer',
      channelName: '20th Century Studios',
      description:
          'Human emotion meets grounded science fiction in a future shaped by AI conflict.',
      category: 'Short Films',
    ),
    Video(
      youtubeId: 'pBk4NYhWNMM',
      title: 'Barbie - Main Trailer',
      channelName: 'Warner Bros. Pictures',
      description:
          'A bold, playful trailer with bright production design and sharp comic timing.',
      category: 'Interviews',
    ),
  ];
}
