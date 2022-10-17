


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api/repositories/repository.dart';

import 'bloc/bloc.dart';
import 'bloc/bloc_events.dart';
import 'bloc/bloc_states.dart';
import 'detial_screen.dart';
import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create : (context) => UserRepository(),
        child : const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("1st Bloc App"),
          ),
          body: BlocBuilder<UserBloc, UserState> (
            builder: (context, state){
              if(state is UserLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(state is UserLoadedState){
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  e: userList[index],
                                )
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                              title: Text(userList[index].firstName,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              subtitle: Text(userList[index].lastName,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              trailing: CircleAvatar(
                                backgroundImage: NetworkImage(userList[index].avatar),
                              )
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              if(state is UserErrorState){
                return Center(child: Text("Error"));
              }

              return Container();
            },
          )
      ),
    );
  }
}

