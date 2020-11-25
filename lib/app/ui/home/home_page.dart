import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/ui/home/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: GetBuilder<HomeController>(
          // init: HomeController(repository: HomeRepository(apiClient: MyApiClient(httpClient: http.Client()))),
          builder: (_){
            return RefreshIndicator(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return ytWidget();
                },
              ),
            onRefresh: _.updateVidsList,
            );
          }
      ),
      // body: RefreshIndicator(
      //   child: ListView(
      //     children: [
      //       Container(child: Center(child: Text("List Videos"),),)
      //     ],
      //   ),
      //   onRefresh: () { null;},
      // ),
      // body: Container(
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Home Page here"),
        //     RaisedButton(onPressed: ()=> print("pressed"),child: Text("Change theme"),)
        //   ],
        // ),
    );
  }
}
