import 'package:apioment/applicationbloc/ApplicationBloc.dart';
import 'package:apioment/applicationbloc/ApplicationEvents.dart';
import 'package:apioment/applicationbloc/ApplicationState.dart';
import 'package:apioment/kaizenControls/MedTextStyles.dart';
import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicoplusErrorPage extends StatelessWidget {
  BuildContext applicationContext;
  MedicoPlusErrorState error;
  MedicoplusErrorPage(this.applicationContext, this.error, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MedicoControls.VerticalFiller(50),
            Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  error.title,
                  textAlign: TextAlign.left,
                  style: MedTextStyles.pageHeaderStyle(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    error.errorMessage,
                    style: MedTextStyles.normalDescriptionStyle(),
                  ),
                ),
              ),
            ),
            MedicoControls.kaizenRetryButton("Restart Application", () {
              final appSchedulerBloc =
                  BlocProvider.of<ApplicationBloc>(applicationContext);
              appSchedulerBloc.add(RequestQRScanEvent());
            })
          ],
        ),
      ),
    );
  }
}
