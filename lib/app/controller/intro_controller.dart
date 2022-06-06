import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroController extends GetxController {

  List<PageViewModel> listPagesViewModel = [];
  final GlobalInformationRepository repository = GlobalInformationRepository(globalInformationApi: GlobalInformationApi());

  @override
  void onInit() async {
    await createList();
    super.onInit();
  }
  navigateNext(){
    repository.sawIntro();
    Get.toNamed(Routes.DETAILS);
  }

  Future createList() async {
    listPagesViewModel.add(
        PageViewModel(
          title: "Bem-vindo(a) ao projeto Araci.lab!",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text("Araci.lab é um braço da Araci Incubadora de Projetos de Cinema e Audiovisual voltado para a formação. A proposta é promover encontros entre estudantes e profissionais, realizar oficinas de desenvolvimento de projetos e oferecer cursos de curta duração voltados para o trabalho audiovisual. Entre os objetivos da Araci estão a profissionalização dos graduandos, a divulgação e aplicabilidade da pesquisa científica do campo e a formação continuada dos egressos de cinema e audiovisual. A ideia é a criação de um repositório digital para que todos tenham acesso às ações da Araci.lab e possam consultar a qualquer momento a partir de seus telefones celulares.  ", overflow: TextOverflow.visible)),

            ],
          ),
          image: Center(child: Container(child: Image.asset("assets/images/AraciLabLogo.png"), decoration: BoxDecoration(color: Color(0xFFD6D6D6).withOpacity(0.4)),)),
        ),

    );

    // listPagesViewModel.add(
    //   PageViewModel(
    //     title: "Confira o app Araci!",
    //     bodyWidget: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae feugiat enim. Fusce nec dui porttitor augue sodales imperdiet. Quisque commodo lorem ut rhoncus auctor. Nunc vel diam porttitor, lacinia lorem id, suscipit sapien. Curabitur sit amet dui eu lectus tempus sollicitudin ac eu quam. Maecenas molestie est molestie, tincidunt augue id, consequat risus. Cras at nibh eu quam ornare condimentum sit amet et elit. Aenean congue, diam imperdiet condimentum auctor, velit libero ullamcorper lectus, id consequat risus mauris a purus. Aliquam pharetra ultrices lacus, a rhoncus nulla. Nullam faucibus ex quis sem rhoncus, a facilisis mi sagittis. Sed vehicula massa nulla, et consequat purus tristique non. Phasellus aliquet sed tellus aliquet ullamcorper. ", overflow: TextOverflow.visible)),
    //       ],
    //     ),
    //     image: Center(child: SvgPicture.asset("assets/images/LogoUFF.svg")),
    //   ),
    //
    // );

  }


}

