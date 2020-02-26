import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgbloc/pagetwo.dart';

import 'bloc/emailFieldBloc/emailBlocExport.dart';
import 'bloc/passwordFieldBloc/passwordBlocExport.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmailBloc()),
        BlocProvider(create: (context) => PasswordBloc())
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final emailBLoc = BlocProvider.of<EmailBloc>(context);
    final passwordBloc = BlocProvider.of<PasswordBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<EmailBloc, EmailState>(
                  bloc: emailBLoc,
                  builder: (context, state) {
                    if (state is InitialEmailState ||
                        state is CorrectEmailState)
                      {
                        return TextField(
                        onChanged: (input) =>
                            emailBLoc.add(ValidateEmail(input)),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                        ),
                      );}
                    else if (state is WrongEmailState)
                      {
                        return TextField(
                        onChanged: (input) =>
                            emailBLoc.add(ValidateEmail(input)),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter email",
                            labelText: "Email",
                            errorText: state.errorMessage),
                      );}
                    return null;
                  }),
              SizedBox(
                height: 20.0,
              ),
              BlocBuilder<PasswordBloc, PasswordState>(
                  bloc: passwordBloc,
                  builder: (context, state) {
                    if (state is InitialPasswordState ||
                        state is CorrectPasswordState)
                      {
                        return TextField(
                        onChanged: (input)=>passwordBloc.add(ValidatePasswordEvent(input)),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      );}
                    else if (state is WrongPasswordState)
                      {
                        return TextField(
                        onChanged: (input)=>passwordBloc.add(ValidatePasswordEvent(input)),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter password",
                          labelText: "Password",
                          errorText: state.errorMessage
                        ),
                      );}
                    return null;
                  }),
              SizedBox(
                height: 20.0,
              ),
                BlocBuilder(
                  bloc: emailBLoc,
                  builder: (context,state)
                    {
                      if(state is CorrectEmailState)
                      return BlocBuilder(
                      bloc:passwordBloc,
                      builder: (context,state){
                        if(state is CorrectPasswordState)
                          return RaisedButton(color: Colors.tealAccent,onPressed: ()=>changeThePage(context),child: Text('Submit'),);
                        else 
                          return RaisedButton(color: Colors.tealAccent,onPressed: null,child: Text('Submit'),);
                      }
                          
                    );
                    else return RaisedButton(color: Colors.tealAccent,onPressed: null,child: Text('Submit'),);
                    })
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
