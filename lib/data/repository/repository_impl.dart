import 'dart:async';
import 'package:get/get.dart';
import 'package:gorest_graphql/const/app_const.dart';
import 'package:gorest_graphql/data/model/PagedUserModel.dart';
import 'package:gorest_graphql/data/network_core.dart';
import 'package:gorest_graphql/data/repository/repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:gorest_graphql/const/query/users.dart';

class RepositoryImpl implements Repository {
  NetworkCore network = Get.find<NetworkCore>();
  HasuraConnect hasuraConnect = HasuraConnect(baseUrl);

  @override
  FutureOr<PagedUserModel?> getPagedUserList(String pageKey) async {
    try {
      var response = await hasuraConnect
          .query(userList, variables: {"first":10,"after": pageKey});
      return PagedUserModel.fromJson(response);
    } on Exception catch (e) {
      return null;
    }
  }
}
