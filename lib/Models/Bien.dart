class Bien {
  int id;
  String nom;
  String position;
  String numero;
  String description;
  String prix;

  Bien(
      {this.id,
      this.nom,
      this.position,
      this.numero,
      this.description,
      this.prix});

  factory Bien.fromJson(Map<String, dynamic> json) {
    return Bien(
      id: json['id'],
      nom: json['nom'],
      position: json['position'],
      numero: json['numero'],
      description: json['description'],
      prix: json['prix'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'numero': numero,
        'position': position,
        'description': description,
        'prix': prix,
      };
}
