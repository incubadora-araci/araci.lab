import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:araci/app/ui/reusable_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.mainAppBar(),
      body: Container(
        child: GetBuilder<DetailsController>(
            builder: (_) {
              ///TODO: Implement the logic to get data from the maps
              return Column(
                children: [
                  ConstrainedBox(
                    constraints:
                    BoxConstraints(maxHeight: 450, minHeight: 56.0),
                    child: ListView(
                      children: [
                        imageCard(_.imgPath??"assets/testImages/CosmeCoffee.png"),
                        SizedBox(height: 40, child: markdownTitleWidget(_.articleTitle??"# Cosme Corrêa")),
                        SizedBox(child: markdownBodyWidget(_.articleBody??"**Cosme** nasceu em Volta Redonda e jogava Atari. Proin id mauris ultrices, dictum eros sit amet, rhoncus felis. Etiam ac dui augue. Sed convallis justo nec erat laoreet volutpat in accumsan mauris. Vivamus aliquet velit pellentesque, "
                            "commodo purus sed, commodo lacus. Proin interdum est ut dignissim euismod. Phasellus non nisl lorem. Aliquam consequat ac felis ut malesuada. Pellentesque ultrices, arcu ut tempor convallis, purus arcu placerat massa, eu condimentum nisl sem consequat dui. Suspendisse eget lectus nec libero condimentum ultrices. Curabitur rutrum odio sed tincidunt dapibus. "

              "Etiam tincidunt justo arcu, ac cursus velit ultricies vel. Donec lectus ipsum, tempus eget velit eu, gravida malesuada nibh. Sed id nisl at tortor interdum bibendum eget ut nisl. Nulla molestie nisi sit amet dolor bibendum convallis. Etiam eget blandit nisl. Proin tellus tortor, mollis sed dolor maximus, blandit mattis sapien. Suspendisse tellus massa, tempus id efficitur sed, volutpat nec diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean euismod leo enim, eget pharetra sapien lacinia vel. Suspendisse ut massa in augue hendrerit tristique vel at est. Proin at urna non libero porttitor volutpat. Integer risus lorem, posuere eget faucibus et, accumsan semper nisi. Suspendisse potenti. Donec pellentesque, enim vitae tempor ullamcorper, ipsum enim eleifend mauris, eget consectetur metus sapien et odio."

              "Duis convallis ornare sem. Morbi sodales, lectus ut consequat condimentum, mi risus lacinia justo, nec imperdiet quam neque ac neque. Sed imperdiet dui arcu, nec cursus augue lobortis volutpat. Aenean ligula nisi, facilisis at leo ac, volutpat rutrum nulla. Phasellus euismod, ligula nec mollis blandit, eros lectus sodales sapien, eget pellentesque elit elit non turpis. Sed sit amet molestie mi. Sed non ligula blandit, vulputate enim id, facilisis ex. Nam non justo neque. Duis sodales neque vel neque vestibulum fermentum. Etiam mi elit, viverra non porta eget, posuere quis tortor."))
                      ],
                    ),
                  ),
                  Divider(),
                  Container(child: Markdown(data: "# Relacionados", shrinkWrap: true, physics: ScrollPhysics(),), height: 70,),
                  Expanded(
                    child: relatedArticles(),
                  )
//                  ytWidget(),
                  //TODO: Implement mini widgets for the related session
                ],
              );
            }),
      ),
    );
  }

}
