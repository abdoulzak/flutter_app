class ArticleCard {
  final String id;
  final String nom;
  final String description;
  final String expirdate;
  final String note;
  final String position;
  final String statut;
  final String creatdate;

  ArticleCard(
      {this.id,
      this.nom,
      this.description,
      this.expirdate,
      this.note,
      this.position,
      this.statut,
      this.creatdate});

  factory ArticleCard.fromJson(Map<String, dynamic> json) {
    return ArticleCard(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      expirdate: json['expirdate'],
      note: json['note'],
      position: json['position'],
      statut: json['statut'],
      creatdate: json['creatdate'],
    );
  }
}
