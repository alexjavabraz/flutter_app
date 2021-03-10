import 'package:flutter/material.dart';
import 'package:flutter_app/components/user_tile.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/provider/users.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  UserList({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        itemCount: users.count,
      ),
    );
  }
}
