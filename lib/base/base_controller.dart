import 'package:get/get.dart';
import 'package:gorest_graphql/data/repository/repository.dart';

class BaseController extends GetxController{
  Repository repository = Get.find<Repository>();
}