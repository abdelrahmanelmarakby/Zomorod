class Video {
  final String miniatureImagePath;
  final String title;
  final Channel channel;
  final DateTime timestamp;
  String duration;
  List<String> tags;
  final int viewsCounter;
  final int likesCounter;
  final int dislikesCounter;

  Video(
    this.miniatureImagePath,
    this.title,
    this.channel,
    this.timestamp, {
    this.tags = const [],
    this.viewsCounter = 0,
    this.likesCounter = 0,
    this.dislikesCounter = 0,
    this.duration = '00:00',
  });
}

class Channel {
  final String name;
  String logoImagePath;
  String imageUrl;
  int subscribersCounter;

  Channel(
    this.name, {
    this.logoImagePath = '/',
    this.imageUrl = '/',
    this.subscribersCounter = 0,
  });
}

class Comment {
  String? Id;
  String? avatarImagePath;
  String username;
  String text;

  Comment(this.avatarImagePath, this.text, {this.username = 'null'});
}

class VideoComments {
  int numberOfComments;
  Comment topComment;

  VideoComments(
    this.topComment, {
    this.numberOfComments = 0,
  });
}

Channel currentUser = Channel(
  'John Steck',
  logoImagePath: 'assets/images/profile_screen/avatars/profile.png',
  imageUrl: 'https://avatars.githubusercontent.com/u/63707307?v=4',
  subscribersCounter: 100000,
);

Channel currentVideoDetailChannel = Channel(
  'Fireship',
  logoImagePath: 'assets/images/video_detail/logos/fireship_logo.jpg',
  subscribersCounter: 865000,
);

Video currentVideo = Video(
  'assets/images/video_detail/miniatures/0.jpg',
  'React Native vs Flutter - I built the same chat app with both',
  currentVideoDetailChannel,
  DateTime(2021, 21, 10),
  tags: ['#flutter', '#react', '#versus'],
  viewsCounter: 282000,
  likesCounter: 13000,
  dislikesCounter: 170,
);

VideoComments currentVideoComments = VideoComments(
    Comment(
        'assets/images/video_detail/avatars/avatar0.jpg',
        'I love this guy I literally asked for this video '
            'and he made it, he made the tech stacks video like so too. '
            'He is close to his viewers and comment...'),
    numberOfComments: 799);

final List<Video> recommendations = [
  Video(
    'assets/images/video_detail/miniatures/1.jpg',
    'How to OVER Engineer a Website // What is a Tech Stack?',
    currentVideoDetailChannel,
    DateTime(2021, 29, 9),
    viewsCounter: 358000,
  ),
  Video(
    'assets/images/video_detail/miniatures/1.jpg',
    'No more real videos from Fireship, they didn\'t sponsor me',
    currentVideoDetailChannel,
    DateTime(2020, 1, 1),
    viewsCounter: 0,
  ),
  Video(
    'assets/images/video_detail/miniatures/1.jpg',
    'Seriously, no more real videos',
    currentVideoDetailChannel,
    DateTime(2010, 5, 4),
    viewsCounter: 42,
  ),
  Video(
    'assets/images/video_detail/miniatures/1.jpg',
    'How to waste 3 hrs of your life on trying to render images with Genymotion',
    currentVideoDetailChannel,
    DateTime(2018, 3, 3),
    viewsCounter: 9000000000,
  ),
  Video(
    'assets/images/video_detail/miniatures/1.jpg',
    '...and end up using the Android Studio emulator',
    currentVideoDetailChannel,
    DateTime(2019, 23, 2),
    viewsCounter: -2,
  ),
];

final List<Video> homeScreenVideos = [
  Video(
    'https://i.ytimg.com/vi/h0IAgkHpU54/hq720.jpg',
    'Porsche Taycan Turbo S (761hp) - 0-270 km/h LAUNCH CONTROL🏁',
    currentUser,
    DateTime(2021, 3, 20),
    duration: '8:20',
    viewsCounter: 10000,
    likesCounter: 958,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/5qap5aO4i9A/hq720_live.jpg',
    'lofi hip hop radio - beats to relax/study to',
    currentUser,
    DateTime(2021, 2, 26),
    duration: '22:06',
    viewsCounter: 8000,
    likesCounter: 485,
    dislikesCounter: 8,
  ),
  Video(
    'https://i.ytimg.com/vi/_V1URhdh8mI/hqdefault.jpg',
    'Need For Speed in Real Life Part II',
    currentUser,
    DateTime(2020, 7, 12),
    duration: '10:53',
    viewsCounter: 18000,
    likesCounter: 1000,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/h0IAgkHpU54/hq720.jpg',
    'Porsche Taycan Turbo S (761hp) - 0-270 km/h LAUNCH CONTROL🏁',
    currentUser,
    DateTime(2021, 3, 20),
    duration: '8:20',
    viewsCounter: 10000,
    likesCounter: 958,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/5qap5aO4i9A/hq720_live.jpg',
    'lofi hip hop radio - beats to relax/study to',
    currentUser,
    DateTime(2021, 2, 26),
    duration: '22:06',
    viewsCounter: 8000,
    likesCounter: 485,
    dislikesCounter: 8,
  ),
  Video(
    'https://i.ytimg.com/vi/_V1URhdh8mI/hqdefault.jpg',
    'Need For Speed in Real Life Part II',
    currentUser,
    DateTime(2020, 7, 12),
    duration: '10:53',
    viewsCounter: 18000,
    likesCounter: 1000,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/h0IAgkHpU54/hq720.jpg',
    'Porsche Taycan Turbo S (761hp) - 0-270 km/h LAUNCH CONTROL🏁',
    currentUser,
    DateTime(2021, 3, 20),
    duration: '8:20',
    viewsCounter: 10000,
    likesCounter: 958,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/5qap5aO4i9A/hq720_live.jpg',
    'lofi hip hop radio - beats to relax/study to',
    currentUser,
    DateTime(2021, 2, 26),
    duration: '22:06',
    viewsCounter: 8000,
    likesCounter: 485,
    dislikesCounter: 8,
  ),
  Video(
    'https://i.ytimg.com/vi/_V1URhdh8mI/hqdefault.jpg',
    'Need For Speed in Real Life Part II',
    currentUser,
    DateTime(2020, 7, 12),
    duration: '10:53',
    viewsCounter: 18000,
    likesCounter: 1000,
    dislikesCounter: 4,
  ),
];
