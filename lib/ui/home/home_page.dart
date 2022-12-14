import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorest_graphql/data/model/PagedUserModel.dart';
import 'package:gorest_graphql/ui/home/home_Controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("User List"),
              ),
              body: RefreshIndicator(
                onRefresh: ()async{
                 controller.update();
                },
                child: PagedListView<String, Nodes>(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Nodes>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(
                              child: CircularProgressIndicator(
                            color: Colors.deepOrange,
                          )),
                      newPageProgressIndicatorBuilder: (context) => const Center(
                            child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.redAccent)),
                          ),
                      itemBuilder: (context, item, index) => Card(
                            child: InkWell(
                              onTap: (){},
                              child: ListTile(
                                title: Text(item.name ?? '-'),
                                subtitle: Text(item.email ?? '-'),
                                trailing: Icon(item.gender == "male"
                                    ? Icons.male
                                    : Icons.female),
                              ),
                            ),
                          )),
                ),
              ),
            ));
  }
}
