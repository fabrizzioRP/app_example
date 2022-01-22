// ignore_for_file: use_key_in_widget_constructors

import 'package:app_examples/models/user_model.dart';
import 'package:flutter/material.dart';

class SearchableScreen extends StatefulWidget {
  @override
  State<SearchableScreen> createState() => _SearchableScreenState();
}

class _SearchableScreenState extends State<SearchableScreen> {
  final List<UserModel> usuarios = [
    UserModel(
        id: 1,
        name: 'Francisca',
        email: 'Francisca@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 2,
        name: 'Emilia',
        email: 'Emilia@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 3,
        name: 'Marcos',
        email: 'Marcos@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 4,
        name: 'Juan',
        email: 'Juan@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 5,
        name: 'Maria',
        email: 'Maria@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 6,
        name: 'Pepito',
        email: 'Pepito@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 7,
        name: 'Lucho',
        email: 'Lucho@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 8,
        name: 'Juanito',
        email: 'Juanito@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 9,
        name: 'Maria Paz',
        email: 'MariaPaz@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
    UserModel(
        id: 10,
        name: 'Cristian',
        email: 'Cristian@gmail.com',
        urlImg: 'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
  ];

  List<UserModel> foundUser = [];

  @override
  void initState() {
    setState(() {
      foundUser = usuarios;
    });
    super.initState();
  }

  void searchUser(String name) {
    setState(() {
      foundUser = usuarios
          .where((user) => user.name.toLowerCase().contains(name))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 38,
          width: 270,
          child: TextField(
            cursorColor: Colors.red,
            onChanged: (value) => searchUser(value),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              hintText: 'Search Users',
            ),
          ),
        ),
      ),
      body: foundUser.isEmpty ? _noUserBody() : _userSearch(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'HeroBackButtom',
        child: const Icon(Icons.home),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  ListView _userSearch() => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: foundUser.length,
        separatorBuilder: (_, i) => const Divider(color: Colors.grey),
        itemBuilder: (_, i) {
          final user = foundUser[i];
          return ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(user.urlImg),
            ),
            title: Text(user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                )),
            subtitle: Text(user.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                )),
          );
        },
      );

  Widget _noUserBody() => const Center(
        child: Icon(Icons.flutter_dash_outlined, size: 100, color: Colors.blue),
      );
}
