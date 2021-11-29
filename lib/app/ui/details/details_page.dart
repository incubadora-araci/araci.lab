import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/details/widgets/article_widget.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:araci/app/ui/details/widgets/relatedcard_widget.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: Get.find<DetailsController>().scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
            SliverAppBar(
              leading: GetX<DetailsController>(
                builder: (_) => _.displayLeading ? IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  onPressed: ()=> Get.find<DetailsController>().popRoute(),
                ): Container(width: 0.0, height: 0.0,),
              ),
              actions: [
                PopupMenuButton<String>(
                  onSelected: Get.find<DetailsController>().handlePopMenuClick,
                  itemBuilder: (BuildContext context) {
                    return {'Sobre','Equipe', 'Configurações', Get.find<DetailsController>().isLogged() ? 'Sair' : 'Entrar', 'Rever Introdução'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image.asset(
                    "assets/images/regia_araci.png",
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                  Text("ARACI.lab", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))
                  ],
                ),
                // background: GetX<DetailsController>(builder: (_) => Image.network(_.imgUrl),),
                background: GetX<DetailsController>(builder: (_) => _.imgUrl!=null ? CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: _.imgUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
                  // errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                  ) : Image.asset("assets/images/regia_araci.png", fit: BoxFit.cover,)),
              ),
            )
            ];
          },
          body: WillPopScope(
            onWillPop: ()=>Get.find<DetailsController>().popRoute(),
            child: GetBuilder<DetailsController>(
                builder: (_) {
                  return  _.isLoading ?
                  Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando publicações"),
                    ],
                  )) : ListView(
                    children: [
                      article(_),
                      Divider(),
                      Container(child: Markdown(data: _.articleId == 1? "# Acesse o Conteúdo" : "# Relacionados",
                        shrinkWrap: true,
                        physics: ScrollPhysics(),), height: 70,),
                      if (_.externalUrl != null)
                        ListTile(
                          leading: relatedCard(_.imgUrl??"assets/images/regia_araci.png"),
                          title: Markdown(data: "Acesse o link", shrinkWrap: true, physics: ScrollPhysics(),),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            //print("ON TAP!!");
                            _.handleHyperLink(_.externalUrl,linkTitle: _.articleTitle);
                          }
                        ),
                      if (_.relatedIds != null)
                        Container(
                          child: relatedArticles(_.relatedArticlesInformation),
                      ),
                      //If is Banco de talentos create Talent Page on related
                      if(_.articleId == 12)
                      ListTile(
                        leading: Image.asset("assets/images/regia_araci.png", fit: BoxFit.cover,),
                        title:Text("Abrir Banco de Talentos"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: ()=>Get.toNamed(Routes.TALENT),
                      )
                    ],
                  );
                }
            ),
          ),
      ),
    );
  }

}
