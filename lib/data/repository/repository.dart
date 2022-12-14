import 'dart:async';

import 'package:gorest_graphql/data/model/PagedUserModel.dart';

abstract class Repository{
FutureOr<PagedUserModel?> getPagedUserList(String pageKey);
}