import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:apioment/models/PatientSchedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCardWidget extends StatelessWidget {
  final PatientSchedule schedule;

  const ScheduleCardWidget({required this.schedule});

  @override
  Widget build(BuildContext context) {
    DateFormat timeFormat = DateFormat('h:mm a');
    String formattedStartTime = timeFormat.format(schedule.startTime);
    String formattedEndTime = timeFormat.format(schedule.endTime);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: getGradientColor(schedule.type).headerGradient,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: <Widget>[
            Card(
              color: getGradientColor(schedule.type).headerGradient.colors[1],
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: Row(
                      children: <Widget>[
                        MedicoControls.NormalTextCard('   ${schedule.type}')
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    color: getGradientColor(schedule.type)
                        .headerGradient
                        .colors[0],
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        MedicoControls.NormalTextCard(
                          formattedStartTime,
                        ),
                        MedicoControls.NormalTextCard(
                          "  To ",
                        ),
                        MedicoControls.NormalTextCard(
                          formattedEndTime,
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: getGradientColor(schedule.type).bottomGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _buildScheduleDetails(schedule.type, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleDetails(String caseType, BuildContext context) {
    switch (caseType) {
      case 'Free':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 90, top: 20, bottom: 30),
                  child: MedicoControls.CardinsideText("AVAILABLE"),
                ),
              ],
            ),
          ],
        );
      case 'Appointment':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MedicoControls.NormalTextCard(
                  'MR No: ${schedule.patientMRNumber}',
                ),
                MedicoControls.NormalTextCard(
                  'Name: ${schedule.patientName}',
                ),
                MedicoControls.NormalTextCard(
                  ' ',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MedicoControls.NormalTextCard(
                  'Consulted Doctor : ${schedule.consultedDoctorName ?? 'N/A'}',
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MedicoControls.NormalTextCard(
                  'Treatment Name  :  ${schedule.treatmentName ?? 'N/A'}',
                )
              ],
            ),
            SizedBox(height: 15),
          ],
        );
      case 'Block':
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 90, top: 20, bottom: 30),
                  child: MedicoControls.CardinsideText(
                      schedule.blockReason.toString()),
                ),
              ],
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
