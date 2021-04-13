class Besoin {
  int id;
  String nom;
  String numero;
  String description;
  String date;

  Besoin({this.id, this.nom, this.numero, this.description, this.date});

  factory Besoin.fromJson(Map<String, dynamic> json) {
    return Besoin(
      id: json['id'],
      nom: json['nom'],
      numero: json['numero'],
      description: json['description'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'numero': numero,
        'description': description,
        'date': date,
      };
}
