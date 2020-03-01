import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tao_ticket/model/nav_home/recommend.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/utils/dio.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';
import 'package:tao_ticket/widgets/tic_swiper.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  RecommendModel _recdModel;

  double horizontal = 18;
  ScrollController _scrollController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    if(_recdModel is! RecommendModel) {
      _fatchData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enablePullUp: true,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          TicSwipper(
            itemLists: _recdModel?.swipersData ?? [],
            margin: EdgeInsets.symmetric(horizontal: horizontal),
          ),
          _titleView(title: '即将上映', subTitle: '全部影片'),
          Container(
            height: 190,
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: _filmLists(context),
          ),
          _titleView(title: '新鲜资讯', subTitle: '我关注的'),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: 10,
            ),
            child: _newsLists(),
          ),
        ],
      ),
    );
  }

  Widget _titleView({String title, String subTitle, Function onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              subTitle + ' >',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _filmLists(context) {
    final _flims = _recdModel?.filmsData ?? [];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _flims.length,
      scrollDirection: Axis.horizontal,
      // itemExtent: 85,
      itemBuilder: (BuildContext context, int index) {
        double _left = 0;
        double _right = 12;
        if (index == 0) {
          _left = 20;
        }
        if (index == _flims.length - 1) {
          _right = 20;
        }
        final item = _flims[index];
        return Container(
          margin: EdgeInsets.only(left: _left, right: _right),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 130,
                margin: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(item.url), fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[],
                ),
              ),
              Text(
                item.title,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                '3月20日上映',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _newsLists() {
    final _news = _recdModel?.newsData ?? [];
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      controller: _scrollController,
      primary: false,
      crossAxisCount: 4,
      itemCount: _news.length,
      itemBuilder: (context, index) {
        final _item = _news[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: _item.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(_item.image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        _item.title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(
                                _item.fromIcon,
                                width: 17,
                              ),
                            ),
                            Text(
                              ' ' + _item.fromName,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            )
                          ],
                        ),
                        Row(children: <Widget>[
                          Utils.iconfont(
                            Iconfont.dianzan,
                            size: 14,
                          ),
                          Text(
                            '赞',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          )
                        ])
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }

  void _onRefresh() async {
    // print(_recdModel is RecommendModel);
    await _fatchData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    // if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  Future<List> _getSwipers() async {
    final swiper = await DioUtils().get('home/swiper');
    return swiper ?? [];
  }

  Future<List> _getFlims() async {
    final flims = await DioUtils().get('home/flims');
    return flims ?? [];
  }

  Future<List> _getNews() async {
    final news = await DioUtils().get('home/news');
    return news ?? [];
  }

  Future _fatchData() async {
    final result = await Future.wait([
      _getSwipers(),
      _getFlims(),
      _getNews(),
    ]);
    setState(() {
      _recdModel = RecommendModel.fromJson(
        swipers: result[0],
        films: result[1],
        news: result[2],
      );
    });
  }
}
