import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/amo/atoms/control_button/widget.dart';
import 'package:tinder_clone/bloc/album/album_bloc.dart';
import 'package:tinder_clone/bloc/current_user/current_user_bloc.dart';
import 'package:tinder_clone/bloc/user/user_bloc.dart';
import 'package:tinder_clone/data/service/api_repository.dart';
import 'package:tinder_clone/data/service/data_repository.dart';
import 'amo/atoms/user_card/widget.dart';
import 'bloc/photo/photo_bloc.dart';

void main() {
  runApp(
    MyApp(
      dataService: DataService(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final DataService dataService;

  const MyApp({
    super.key,
    required this.dataService,
  });

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AlbumBloc>(
            create: (context) => AlbumBloc(
              apiRepository: ApiRepository(
                dataService: dataService,
              ),
            )..add(
                AlbumLoadEvent(),
              ),
          ),
          BlocProvider<PhotoBloc>(
            create: (context) => PhotoBloc(
              apiRepository: ApiRepository(
                dataService: dataService,
              ),
            )..add(
                PhotoLoadEvent(),
              ),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              apiRepository: ApiRepository(
                dataService: dataService,
              ),
            )..add(
                UserLoadEvent(),
              ),
          ),
          BlocProvider<CurrentUserBloc>(create: (context) => CurrentUserBloc())
        ],
        child: const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, child: UserCard()),
              ),
              BlocBuilder<CurrentUserBloc, CurrentUserState>(
                builder: (context, state) {
                  if (state is CurrentUserDetermined) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ControlButton(
                            direction: Direction.previous, state: state),
                        ControlButton(direction: Direction.next, state: state),
                      ],
                    );
                  }
                  return Text('no current user');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
