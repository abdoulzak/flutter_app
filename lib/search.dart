import 'package:flutter/material.dart';
import 'package:flutter_application_0/Models/articlecard.dart';

class Search extends SearchDelegate<String> {
  SearchDelegate<String> searchDelegate;

  //Search();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  final List<ArticleCard> listWords = [];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = listWords;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(listWords[index].nom),
        //subtitle: Text(listWords[index].position),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionListVille = query.isEmpty
        ? listWords
        : listWords
            .where((p) => p.nom.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          /*
          switchcase
              ? depart = suggestionListVille[index].ville
              : depart = suggestionListVille[index].ville;*/
          close(context, suggestionListVille[index].nom);
        },
        trailing: Icon(Icons.arrow_right_alt_rounded),
        title: RichText(
          text: TextSpan(
              text: suggestionListVille[index].nom.substring(0, query.length),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text:
                        suggestionListVille[index].nom.substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: suggestionListVille[index].nom,
            style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemCount: suggestionListVille.length,
    );
  }
}
