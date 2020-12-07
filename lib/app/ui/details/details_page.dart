import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
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
                        imageCard("assets/testImages/CosmeCoffee.png"),
                        SizedBox(height: 40, child: markdownTitleWidget("# Cosme Corrêa")),
                        SizedBox(child: markdownBodyWidget("**Cosme** nasceu em ~~Volta Redonda~~ e jogava ~~Atari~~. "
                            "Aliquam iaculis enim a metus cursus tincidunt. Integer non bibendum est, porta auctor nulla. "
                            "Fusce tempus porta ligula, vitae placerat elit molestie sollicitudin. Nullam at blandit libero."
                            " Vestibulum consectetur, eros in consectetur malesuada, leo lectus egestas lectus, quis tempus odio dui ut elit."
                            " Suspendisse vel erat quis enim pulvinar venenatis. Vestibulum nec nisi ipsum. Aenean bibendum felis in enim lobortis tempus."
                            " Duis blandit ullamcorper nibh in lacinia. Donec ultrices ultricies felis vitae sagittis. Morbi dapibus ante non malesuada varius."
                            " Maecenas tincidunt fringilla enim, porttitor posuere tellus malesuada quis. "
                            "Etiam tincidunt justo arcu, ac cursus velit ultricies vel. Donec lectus ipsum, tempus eget velit eu, gravida malesuada nibh. Sed id nisl at tortor interdum bibendum eget ut nisl. Nulla molestie nisi sit amet dolor bibendum convallis. Etiam eget blandit nisl. Proin tellus tortor, mollis sed dolor maximus, blandit mattis sapien. Suspendisse tellus massa, tempus id efficitur sed, volutpat nec diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean euismod leo enim, eget pharetra sapien lacinia vel. Suspendisse ut massa in augue hendrerit tristique vel at est. Proin at urna non libero porttitor volutpat. Integer risus lorem, posuere eget faucibus et, accumsan semper nisi. Suspendisse potenti. Donec pellentesque, enim vitae tempor ullamcorper, ipsum enim eleifend mauris, eget consectetur metus sapien et odio."))
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
