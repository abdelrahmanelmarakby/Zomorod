import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

List<VideoModel> videos = List.generate(
    20,
    (index) => VideoModel(
          title: videoTitles[index],
          videoUrl: videoLinks[index],
          viewsCounter: Random().nextInt(2000),
          dislikesCounter: Random().nextInt(2000),
          likesCounter: Random().nextInt(2000),
          duration: '4:32',
          tags: [tags[index]],
          comments: [comments[index]],
        ));

class VideoModel {
  final String? id;
  final String? miniatureImageUrl;
  final String? videoUrl;
  final String? title;
  final Channel? channel;
  final DateTime? timestamp;
  final List<Comment>? comments;
  final String? duration;
  final List<String>? tags;
  final int? viewsCounter;
  final int? likesCounter;
  final int? dislikesCounter;
  VideoModel({
    this.id,
    this.miniatureImageUrl,
    this.videoUrl,
    this.title,
    this.channel,
    this.timestamp,
    this.comments,
    this.duration,
    this.tags,
    this.viewsCounter,
    this.likesCounter,
    this.dislikesCounter,
  });

  VideoModel copyWith({
    String? id,
    String? miniatureImageUrl,
    String? videoUrl,
    String? title,
    Channel? channel,
    DateTime? timestamp,
    List<Comment>? comments,
    String? duration,
    List<String>? tags,
    int? viewsCounter,
    int? likesCounter,
    int? dislikesCounter,
  }) {
    return VideoModel(
      id: id ?? this.id,
      miniatureImageUrl: miniatureImageUrl ?? this.miniatureImageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      title: title ?? this.title,
      channel: channel ?? this.channel,
      timestamp: timestamp ?? this.timestamp,
      comments: comments ?? this.comments,
      duration: duration ?? this.duration,
      tags: tags ?? this.tags,
      viewsCounter: viewsCounter ?? this.viewsCounter,
      likesCounter: likesCounter ?? this.likesCounter,
      dislikesCounter: dislikesCounter ?? this.dislikesCounter,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (miniatureImageUrl != null) {
      result.addAll({'miniatureImageUrl': miniatureImageUrl});
    }
    if (videoUrl != null) {
      result.addAll({'videoUrl': videoUrl});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (channel != null) {
      result.addAll({'channel': channel!.toMap()});
    }
    if (timestamp != null) {
      result.addAll({'timestamp': timestamp!.millisecondsSinceEpoch});
    }
    if (comments != null) {
      result.addAll({'comments': comments!.map((x) => x.toMap()).toList()});
    }
    if (duration != null) {
      result.addAll({'duration': duration});
    }
    if (tags != null) {
      result.addAll({'tags': tags});
    }
    if (viewsCounter != null) {
      result.addAll({'viewsCounter': viewsCounter});
    }
    if (likesCounter != null) {
      result.addAll({'likesCounter': likesCounter});
    }
    if (dislikesCounter != null) {
      result.addAll({'dislikesCounter': dislikesCounter});
    }

    return result;
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      miniatureImageUrl: map['miniatureImageUrl'],
      videoUrl: map['videoUrl'],
      title: map['title'],
      channel: map['channel'] != null ? Channel.fromMap(map['channel']) : null,
      timestamp: map['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'])
          : null,
      comments: map['comments'] != null
          ? List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x)))
          : null,
      duration: map['duration'],
      tags: List<String>.from(map['tags']),
      viewsCounter: map['viewsCounter']?.toInt(),
      likesCounter: map['likesCounter']?.toInt(),
      dislikesCounter: map['dislikesCounter']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoModel(id: $id, miniatureImageUrl: $miniatureImageUrl, videoUrl: $videoUrl, title: $title, channel: $channel, timestamp: $timestamp, comments: $comments, duration: $duration, tags: $tags, viewsCounter: $viewsCounter, likesCounter: $likesCounter, dislikesCounter: $dislikesCounter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoModel &&
        other.id == id &&
        other.miniatureImageUrl == miniatureImageUrl &&
        other.videoUrl == videoUrl &&
        other.title == title &&
        other.channel == channel &&
        other.timestamp == timestamp &&
        listEquals(other.comments, comments) &&
        other.duration == duration &&
        listEquals(other.tags, tags) &&
        other.viewsCounter == viewsCounter &&
        other.likesCounter == likesCounter &&
        other.dislikesCounter == dislikesCounter;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        miniatureImageUrl.hashCode ^
        videoUrl.hashCode ^
        title.hashCode ^
        channel.hashCode ^
        timestamp.hashCode ^
        comments.hashCode ^
        duration.hashCode ^
        tags.hashCode ^
        viewsCounter.hashCode ^
        likesCounter.hashCode ^
        dislikesCounter.hashCode;
  }
}

class Channel {
  final String? name;
  final String? logoImagePath;
  final String? imageUrl;
  final int? subscribersCounter;
  Channel({
    this.name,
    this.logoImagePath,
    this.imageUrl,
    this.subscribersCounter,
  });

  Channel copyWith({
    String? name,
    String? logoImagePath,
    String? imageUrl,
    int? subscribersCounter,
  }) {
    return Channel(
      name: name ?? this.name,
      logoImagePath: logoImagePath ?? this.logoImagePath,
      imageUrl: imageUrl ?? this.imageUrl,
      subscribersCounter: subscribersCounter ?? this.subscribersCounter,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (logoImagePath != null) {
      result.addAll({'logoImagePath': logoImagePath});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (subscribersCounter != null) {
      result.addAll({'subscribersCounter': subscribersCounter});
    }

    return result;
  }

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      name: map['name'],
      logoImagePath: map['logoImagePath'],
      imageUrl: map['imageUrl'],
      subscribersCounter: map['subscribersCounter']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Channel(name: $name, logoImagePath: $logoImagePath, imageUrl: $imageUrl, subscribersCounter: $subscribersCounter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Channel &&
        other.name == name &&
        other.logoImagePath == logoImagePath &&
        other.imageUrl == imageUrl &&
        other.subscribersCounter == subscribersCounter;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        logoImagePath.hashCode ^
        imageUrl.hashCode ^
        subscribersCounter.hashCode;
  }
}

class Comment {
  String? avatarImagePath;
  String? username;
  String? text;
  Comment({
    this.avatarImagePath,
    this.username,
    this.text,
  });

  Comment copyWith({
    String? avatarImagePath,
    String? username,
    String? text,
  }) {
    return Comment(
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
      username: username ?? this.username,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (avatarImagePath != null) {
      result.addAll({'avatarImagePath': avatarImagePath});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (text != null) {
      result.addAll({'text': text});
    }

    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      avatarImagePath: map['avatarImagePath'],
      username: map['username'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() =>
      'Comment(avatarImagePath: $avatarImagePath, username: $username, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.avatarImagePath == avatarImagePath &&
        other.username == username &&
        other.text == text;
  }

  @override
  int get hashCode =>
      avatarImagePath.hashCode ^ username.hashCode ^ text.hashCode;
}

List<String> videoLinks = [
  "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
  "https://www.youtube.com/watch?v=JGwWNGJdvx8",
  "https://www.youtube.com/watch?v=1Wqbw6jUC4M",
  "https://www.youtube.com/watch?v=JGwCf7L5lak",
  "https://www.youtube.com/watch?v=6Dh-RL__uN4",
  "https://www.youtube.com/watch?v=nZ4t8M9CyvE",
  "https://www.youtube.com/watch?v=iLBBRuVDOo4",
  "https://www.youtube.com/watch?v=8tPnX7OPo0Q",
  "https://www.youtube.com/watch?v=wZZ7oFKsKzY",
  "https://www.youtube.com/watch?v=gkTb9GP9lVI",
  "https://www.youtube.com/watch?v=y6120QOlsfU",
  "https://www.youtube.com/watch?v=7GhIk7vhhlY",
  "https://www.youtube.com/watch?v=8UVNT4wvIGY",
  "https://www.youtube.com/watch?v=otCpCn0l4Wo",
  "https://www.youtube.com/watch?v=3tmd-ClpJxA",
  "https://www.youtube.com/watch?v=9bZkp7q19f0",
  "https://www.youtube.com/watch?v=KmzdUe0RSJo",
  "https://www.youtube.com/watch?v=zztUyIfgRW0",
  "https://www.youtube.com/watch?v=nv9NwDgKlvM",
  "https://www.youtube.com/watch?v=TM8L7bdwVaA",
];

List<String> videoTitles = [
  "The Art of Photography",
  "Cooking with Spices: Flavorful Recipes",
  "Beginner's Guide to Yoga",
  "Exploring Ancient Ruins",
  "DIY Home Decor Ideas",
  "Fitness Tips for Busy Professionals",
  "Traveling on a Budget",
  "Introduction to Astrophysics",
  "Delicious Smoothie Recipes",
  "Mastering the Guitar: Beginner's Course",
  "Baking Bread from Scratch",
  "Mindfulness Meditation Techniques",
  "Interior Design Inspiration",
  "Improving Your Writing Skills",
  "Exploring Marine Life: Underwater Adventures",
  "Healthy Meal Prep for the Week",
  "Introduction to Python Programming",
  "Fashion Trends: Seasonal Lookbook",
  "Sculpting with Clay: Artistic Creations",
  "Effective Time Management Strategies",
];

List<String> imageUrls = [
  "https://example.com/image1.jpg",
  "https://example.com/image2.jpg",
  "https://example.com/image3.jpg",
  "https://example.com/image4.jpg",
  "https://example.com/image5.jpg",
  "https://example.com/image6.jpg",
  "https://example.com/image7.jpg",
  "https://example.com/image8.jpg",
  "https://example.com/image9.jpg",
  "https://example.com/image10.jpg",
  "https://example.com/image11.jpg",
  "https://example.com/image12.jpg",
  "https://example.com/image13.jpg",
  "https://example.com/image14.jpg",
  "https://example.com/image15.jpg",
  "https://example.com/image16.jpg",
  "https://example.com/image17.jpg",
  "https://example.com/image18.jpg",
  "https://example.com/image19.jpg",
  "https://example.com/image20.jpg",
];
List<String> tags = [
  "#gaming",
  "#highlights",
  "#video games",
  "#cooking",
  "#recipes",
  "#fitness",
  "#workout",
  "#travel",
  "#adventure",
  "#web development",
  "#programming",
  "#art",
  "#photography",
  "#music",
  "#fashion",
  "#technology",
  "#nature",
  "#food",
  "#health",
  "#education",
];
List<Comment> comments = [
  Comment(
    avatarImagePath: "avatar1.jpg",
    username: "User1",
    text: "Great video! I really enjoyed it.",
  ),
  Comment(
    avatarImagePath: "avatar2.jpg",
    username: "User2",
    text: "This content is amazing. Keep it up!",
  ),
  Comment(
    avatarImagePath: "avatar3.jpg",
    username: "User3",
    text: "I have a question: Can you explain this concept further?",
  ),
  Comment(
    avatarImagePath: "avatar4.jpg",
    username: "User4",
    text: "Awesome video! I learned a lot from it.",
  ),
  Comment(
    avatarImagePath: "avatar5.jpg",
    username: "User5",
    text: "Could you recommend any additional resources on this topic?",
  ),
  Comment(
    avatarImagePath: "avatar6.jpg",
    username: "User6",
    text: "I appreciate the effort you put into creating this video. Thanks!",
  ),
  Comment(
    avatarImagePath: "avatar7.jpg",
    username: "User7",
    text: "I'm looking forward to more content like this. Subscribed!",
  ),
  Comment(
    avatarImagePath: "avatar8.jpg",
    username: "User8",
    text: "This video helped me solve a problem I was facing. Thank you!",
  ),
  Comment(
    avatarImagePath: "avatar9.jpg",
    username: "User9",
    text: "I shared this video with my friends. They loved it too!",
  ),
  Comment(
    avatarImagePath: "avatar10.jpg",
    username: "User10",
    text: "Your explanations are always clear and easy to understand.",
  ),
  Comment(
    avatarImagePath: "avatar11.jpg",
    username: "User11",
    text: "I'm inspired by your work. Keep creating great content!",
  ),
  Comment(
    avatarImagePath: "avatar12.jpg",
    username: "User12",
    text: "I have been following your channel for a while. Great job!",
  ),
  Comment(
    avatarImagePath: "avatar13.jpg",
    username: "User13",
    text: "I can't wait to try out the tips you shared in this video.",
  ),
  Comment(
    avatarImagePath: "avatar14.jpg",
    username: "User14",
    text: "Your videos are always informative and entertaining. Thanks!",
  ),
  Comment(
    avatarImagePath: "avatar15.jpg",
    username: "User15",
    text: "I've learned so much from your channel. Keep up the good work!",
  ),
  Comment(
    avatarImagePath: "avatar16.jpg",
    username: "User16",
    text: "This video deserves more views. Sharing it right away!",
  ),
  Comment(
    avatarImagePath: "avatar17.jpg",
    username: "User17",
    text: "Your tutorials are the best. I've learned a lot from you.",
  ),
  Comment(
    avatarImagePath: "avatar18.jpg",
    username: "User18",
    text: "I appreciate the time and effort you put into making this video.",
  ),
  Comment(
    avatarImagePath: "avatar19.jpg",
    username: "User19",
    text: "I'm always excited to see a new upload from your channel.",
  ),
  Comment(
    avatarImagePath: "avatar20.jpg",
    username: "User20",
    text: "This video inspired me to pursue my passion. Thank you!",
  ),
];
