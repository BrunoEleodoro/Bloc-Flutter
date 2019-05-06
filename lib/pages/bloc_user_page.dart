import 'package:flutter/material.dart';
import 'package:learning_bloc/blocs/user_bloc.dart';
import 'package:learning_bloc/models/user.dart';
import 'package:learning_bloc/widgets/bloc_provider.dart';

class BlocUserPage extends StatefulWidget {
  @override
  _BlocUserPageState createState() => _BlocUserPageState();
}

class _BlocUserPageState extends State<BlocUserPage> {
  String _newName;

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<User>(
              stream: userBloc.outUser,
              initialData: User.empty(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                return Text(
                  '${snapshot.data.name}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            StreamBuilder<User>(
              stream: userBloc.outUser,
              initialData: User.empty(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: snapshot.data.name,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (a) => _newName = a,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userBloc.updateName.add(_newName);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
