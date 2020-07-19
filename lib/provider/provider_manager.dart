import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'user_provider.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<UserProvider>(
    create: (context) => UserProvider(),
  ),
];