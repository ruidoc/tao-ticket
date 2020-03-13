// import 'package:json_annotation/json_annotation.dart';
// part 'recommend.g.dart';
// @JsonSerializable()

/// 两种定义模型方式：工厂模式和非工厂模式。RecommendModel是工厂类，其他是非工厂类
/// 
class RecommendModel {
  final List<SwiperData> swipersData;
  final List<FilmsData> filmsData;
  final List<NewsData> newsData;

  RecommendModel({
    this.swipersData,
    this.filmsData,
    this.newsData,
  });

  factory RecommendModel.fromJson({
    List swipers,
    List films,
    List news,
  }) {
    // print(films);
    return RecommendModel(
      swipersData: swipers.map((sw) => SwiperData(sw)).toList(),
      filmsData: films.map((fm) => FilmsData(fm)).toList(),
      newsData: news.map((nw) => NewsData(nw)).toList(),
    );
  }
}

// 轮播图数据
class SwiperData {
  int id;
  String title;
  String url;
  // SwiperData({this.id, this.title, this.url});
  SwiperData(Map json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }
}

// 电影数据
class FilmsData {
  int id;
  String title;
  String url;
  // FilmsData({this.id, this.title, this.url});
  FilmsData(Map json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }
}

// 新闻数据
class NewsData {
  double height;
  String title;
  String image;
  String fromName;
  String fromIcon;
  // NewsData({this.height, this.title, this.image, this.fromIcon, this.fromName});
  NewsData(Map json) {
    height = double.parse(json['height'].toString());
    title = json['title'];
    image = json['image'];
    fromIcon = json['from_icon'];
    fromName = json['from_name'];
  }
}
