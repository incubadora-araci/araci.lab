class TalentModel {
  List<Nodes> nodes;

  TalentModel({this.nodes});

  TalentModel fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = [];
      for (var node in json['nodes']){
        // print("will add $node");
        try {
          nodes.add(Nodes.fromJson(node));
        } catch (e) {
          print("ERROR ADDING: $e");
        }
      }
      // json['nodes'].forEach((v) {
      //   // print("will add $v");
      //   nodes.add(Nodes.fromJson(v));
      // });
      return this;
    }else{
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodes != null) {
      data['nodes'] = this.nodes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  toString(){
    return "${nodes[0].node.nome}";
  }
}

class Nodes {
  Node node;

  Nodes({this.node});

  Nodes.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class Node {
  String nome;
  String bio;
  String departamento;
  String email;
  String especialidades;
  String linkArtigosTrabalhosProjetos;
  String linkNoticias;
  String linkLattes;
  String projetosFuturos;
  String site;
  String telefone;
  String vinculo;
  String areaDoConhecimento;
  dynamic fotografia;
  String cv;
  String graduacao;

  Node(
      {this.nome,
        this.bio,
        this.departamento,
        this.email,
        this.especialidades,
        this.linkArtigosTrabalhosProjetos,
        this.linkNoticias,
        this.linkLattes,
        this.projetosFuturos,
        this.site,
        this.telefone,
        this.vinculo,
        this.areaDoConhecimento,
        this.fotografia,
        this.cv,
        this.graduacao
      });

  Node.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    bio = json['bio'];
    departamento = json['departamento'];
    email = json['email'];
    especialidades = json['especialidades'];
    linkArtigosTrabalhosProjetos = json['link_artigos_trabalhos_projetos'];
    linkNoticias = json['link_noticias'];
    linkLattes = json['link_lattes'];
    projetosFuturos = json['projetos_futuros'];
    site = json['site'];
    telefone = json['telefone'];
    vinculo = json['vinculo'];
    areaDoConhecimento = json['area_do_conhecimento'];
    fotografia = json['fotografia'];
    cv = json['cv'];
    graduacao = json['graduacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.nome;
    data['bio'] = this.bio;
    data['departamento'] = this.departamento;
    data['email'] = this.email;
    data['especialidades'] = this.especialidades;
    data['link_artigos_trabalhos_projetos'] = this.linkArtigosTrabalhosProjetos;
    data['link_noticias'] = this.linkNoticias;
    data['link_lattes'] = this.linkLattes;
    data['projetos_futuros'] = this.projetosFuturos;
    data['site'] = this.site;
    data['telefone'] = this.telefone;
    data['vinculo'] = this.vinculo;
    data['area_do_conhecimento'] = this.areaDoConhecimento;
    data['fotografia'] = this.fotografia;
    data['cv'] = this.cv;
    data['graduacao'] = this.graduacao;
    return data;
  }
}