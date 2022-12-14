import 'package:gorest_graphql/base/base_controller.dart';
import 'package:gorest_graphql/data/model/PagedUserModel.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends BaseController {
  PagedUserModel pagedUserList = PagedUserModel();

  final PagingController<String, Nodes> pagingController =
      PagingController(firstPageKey: "");

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPages(pageKey);
    });
  }

  Future<void>fetchPages(String pageKey) async {
    try {
      final newItems = await repository.getPagedUserList(pageKey);
      final isLastPage = newItems!.data!.users!.pageInfo!.hasNextPage;
      if (isLastPage==false) {
        pagingController.appendLastPage(newItems.data!.users!.nodes!);
      } else {
        final nextPageKey = newItems.data!.users!.pageInfo!.endCursor!;
        pagingController.appendPage(
            newItems.data!.users!.nodes!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;

    }
  }
}
