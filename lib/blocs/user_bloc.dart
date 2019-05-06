import 'package:learning_bloc/widgets/bloc_provider.dart';
import 'package:learning_bloc/models/user.dart';
import 'dart:async';
import 'package:learning_bloc/api/db_api.dart';

class UserBloc implements BlocBase {
  User _user;

  // Streams to handle the user.
  StreamController<User> _userController = StreamController<User>.broadcast();

  Sink<User> get _inUser => _userController.sink;

  Stream<User> get outUser => _userController.stream;

  // Streams to handle the action on the user
  StreamController<User> _updateUserController = StreamController();

  Sink<User> get updateUser => _updateUserController.sink;

  // Stream to handle the user name
  StreamController<String> _updateUserNameController = StreamController();

  Sink<String> get updateName => _updateUserNameController.sink;

  UserBloc() {
    api.getUser().then((user) {
      _user = user;
      _inUser.add(_user);
    });
    _updateUserController.stream.listen(_updateUser);
    _updateUserNameController.stream.listen(_updateUserName);
  }

  @override
  void dispose() {
    _userController.close();
  }

  void _updateUser(User user) {
    _user = user;
    _inUser.add(_user);
  }

  void _updateUserName(String name) {
    _user.name = name;
    _inUser.add(_user);
  }
}
