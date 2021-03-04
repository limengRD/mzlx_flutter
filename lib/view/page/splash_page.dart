import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mzlx/utils/util.dart';
import 'package:mzlx/constant/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> _guideList = [
    'assets/images/guides/guide1.png',
    'assets/images/guides/guide2.png',
    'assets/images/guides/guide3.png',
    'assets/images/guides/guide4.png'
  ];
  List<Widget> _bannerList = new List();
  int _state = 0;
  // 初始化数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirst();
  }
  // 判定是否为第一次进入
  void initFirst() async {
    var state = await Utils.getStorage(AppConstant.KEY_GUIDE);
    if(state == null) {
      firstLoading();
    } else {
      notFirstLoading();
    }
  }
  // 第一次进入
  void firstLoading() {
    Utils.setStorage('name', 'mzlx');
    initBannerList();
    setState(() {
      _state = 1;
    });
  }
  // 初始化 banner 数据
  void initBannerList() {
    for(var i=0; i < _guideList.length; i++) {
      _bannerList.add(Image.asset(
        _guideList[i],
        fit: BoxFit.fitWidth,
      ));
    }
  }

  // 不是第一次进入
  void notFirstLoading() {
    setState(() {
      _state = 2;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Offstage(
            offstage: _state == 1,
            child: Text('111111111111111111111111'),
          ),
          Offstage(
            offstage: _state != 1,
            child: Container(
                child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: _bannerList[index],
                  );
                },
                loop: false,
                itemCount: _bannerList.length,
                onTap: (int index) {
                  print(index);
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}