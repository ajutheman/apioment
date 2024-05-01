import 'package:apioment/applicationbloc/ApplicationBloc.dart';
import 'package:apioment/applicationbloc/ApplicationState.dart';
import 'package:apioment/screens/AppointmentView.dart';
import 'package:apioment/screens/NoInternetPage.dart';
import 'package:apioment/screens/connectionPageQR.dart';
import 'package:apioment/screens/loginPage.dart';
import 'package:apioment/screens/medicoplusErrorPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'kaizenwidgects/LoadingIndicator.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => ApplicationBloc(),
        child:
            // appointmentView(
            //   clinicId: 1,
            // )
            App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        if (state is QRCodeState) {
          return ConnectionPage(context);
        } else if (state is MedicoPlusErrorState) {
          return MedicoplusErrorPage(context, state);
        } else if (state is NoInternetState) {
          return NoInternetPage();
        }
        // else if (state is LoginPageState)
        // {
        //   return Loginpage(context);
        // }
        else if (state is LoginPageState) {
          // print("object");
          return Loginpage(context, "");
          // appointmentView(context, state);
          // test();
          // ConnectionPage(context);
        } else if (state is LoginErrorState) {
          // print("object");
          return Loginpage(context, state.errorMessage);
          // appointmentView(context, state);
          // test();
          // ConnectionPage(context);
        } else if (state is ShedulerViewState) {
          return
              // Center(child: CircularProgressIndicator());
              AppointmentView(state.Shedules, state.doctors, context,
                  state.EmpDocNo, state.SelectedDate);
        } else {
          return const Scaffold(body: LoadingIndicator()
              //   Center(
              // child: CircularProgressIndicator(),
              // ),
              );
        }
      },
    );
  }
}
// test
