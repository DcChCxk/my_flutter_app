import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';
import 'package:my_app/base/res/my_style.dart';
import 'package:my_app/base/utils/route_util.dart';
import 'package:my_app/ui/main/dictionary_page.dart';
import 'package:my_app/ui/main/history_today_page.dart';
import 'package:my_app/ui/main/joker_list_page.dart';
import 'package:my_app/ui/main/news_page.dart';
import 'package:my_app/ui/main/phone_query_page.dart';
import 'package:my_app/ui/main/rubish_classify_page.dart';
import 'package:my_app/ui/main/self_ip_page.dart';
import 'package:my_app/ui/main/weather_query_page.dart';


///主页
class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>MainPageState();
}

class MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
        leading: Container(),
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              inkWidget('assets/main/happy.jpg', '开心一下',JokerListPage()),
              inkWidget('assets/main/news.jpg', '每日新闻',NewsPage()),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              inkWidget('assets/main/once.jpg', '历史上的今天',HistoryTodayPage()),
              inkWidget('assets/main/weather.jpg', '天气查询',WeatherQueryPage()),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              inkWidget('assets/main/rubbish.jpg', '垃圾分类',RubbishClassifyPage()),
              inkWidget('assets/main/dictionary.jpg', '汉语字典',DictionaryPage()),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              inkWidget('assets/main/phone.jpg', '手机归属地',PhoneQueryPage()),
              inkWidget('assets/main/my_ip.jpg', '看看自己的IP',SelfIpPage()),
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget inkWidget(String img,String name,Widget page){
    return GestureDetector(
      onTap: (){
        RouteUtil.startActivity(context, page);
      },
      child: Container(
        padding: EdgeInsets.only(left: MyDimens.getWidth(15),right: MyDimens.getWidth(15),top: MyDimens.getHeight(15)),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: MyDimens.getWidth(150),
        child: Column(
          children: [
            Image.asset(img),
            Text(name,style: MyStyle.text_style_18_51_bold,),
          ],
        ),
      ),
    );
  }
}