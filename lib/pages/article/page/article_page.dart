import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: BasicStyle.mainColor,
        brightness: Brightness.dark,
        title: Text(
          "热文",
          style: GoogleFonts.barlow(
            fontSize: ScreenUtil().setSp(36),
            color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(20)
          ),
          children: <Widget>[
            ArticleItem(
              avatar: "https://user-gold-cdn.xitu.io/2020/3/17/170e6b4c0b767ede?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              author: "夜幕镇岳剑丨韦世东",
              type: "juejin",
              title: "忘掉 Snowflake，感受一下性能高出感受一下性能高出 587 倍的全局唯一 ID 生成算法",
              sub: "今天我们来拆解 Snowflake 算法，同时领略百度、美团、腾讯等大厂在全局唯一 ID 服务方面做的设计，接着根据具体需求设计一款全新的全局唯一 ID 生成算法。这还不够，我们会讨论到全局唯一 ID 服务的分布式 CAP 选择与性能瓶颈。",
              look: "326",
              praise: "12",
              comment: "7893",
              dateTime: "2020-07-03 09:33:06",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/7/3/17314031b9c72325?imageView2/0/w/1280/h/960/format/webp/ignore-error/1",
            ),
            ArticleItem(
              avatar: "https://avatar-static.segmentfault.com/335/664/3356645212-5d479ad70df1b_big64",
              author: "美团技术团队",
              type: "segmentFault",
              title: "智能搜索模型预估框架Augur的建设与实践",
              sub: "在过去十年，机器学习在学术界取得了众多的突破，在工业界也有很多应用落地。美团很早就开始探索不同的机器学习模型在搜索场景下的应用，从最开始的线性模型、树模型，再到近两年的深度神经网络、BERT、DQN等，并在实践中也取得了良好的效果与产出。",
              look: "3",
              praise: "7",
              comment: "5",
              dateTime: "2020-07-17 11:00:21",
              thumbnail: "https://image-static.segmentfault.com/380/149/3801490694-d31278df53472e1f_articlex",
            ),
            ArticleItem(
              author: "Cappuccino",
              type: "official",
              title: "iOS14 隐私适配及部分解决方案",
              sub: "在 iOS13 及以前，当用户首次访问应用程序时，会被要求开放大量权限，比如相册、定位、联系人，实际上该应用可能仅仅需要一个选择图片功能，却被要求开放整个照片库的权限，这确实是不合理的。对于相册，在 iOS14 中引入了 “LimitedPhotos Library” 的概念，用户可以授予应用访问其一部分的照片，对于应用来说，仅能读取到用户选择让应用来读取的照片，让我们看到了 Apple 对于用户隐私的尊重。这仅仅是一部分，在iOS14 中，可以看到诸多类似的保护用户隐私的措施，也需要我们升级适配。",
              look: "43",
              praise: "3",
              comment: "28",
              dateTime: "2020-07-17 02:05:08",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/7/16/1735725beaaf9057?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
            ),
            ArticleItem(
              author: "Cappuccino",
              type: "official",
              title: "探究iOS线程调用栈及符号化",
              sub: "调用栈，也称为执行栈、控制栈、运行时栈与机器栈，是计算机科学中存储运行子程序的重要的数据结构，主要存放返回地址、本地变量、参数及环境传递，用于跟踪每个活动的子例程在完成执行后应该返回控制的点。",
              look: "5",
              praise: "1",
              comment: "7",
              dateTime: "2020-07-19 18:05:08",
            ),
            ArticleItem(
              avatar: "https://avatar-static.segmentfault.com/135/740/1357404756-5c7be3eb8b40d_big64",
              author: "SuperX",
              type: "segmentFault",
              title: "【来聊一聊前端架构之一】前端架构认知",
              sub: "没有一种架构是可以满足所有迭代的需求的",
              look: "3365",
              praise: "9",
              comment: "87",
              dateTime: "2020-07-17 11:00:21",
              thumbnail: "https://segmentfault.com/img/remote/1460000023276856",
            ),
          ],
        ),
      ),
    );
  }
}
