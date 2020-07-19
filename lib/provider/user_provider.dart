import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class UserProvider with ChangeNotifier {

  getUserInfo(){
    String _user = SpUtil.getString('userInfo');
    return _user;
  }
  void setUserInfo(String data) async{
    final result = await SpUtil.putString("userInfo", data);
    refresh();
    print("********************用户更新结果：$result******************************");
  }

  void clearUserInfo(){
    final result = SpUtil.remove("userInfo");
    refresh();
    print("********************用户清除结果：$result******************************");
  }


  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    notifyListeners();
  }
}