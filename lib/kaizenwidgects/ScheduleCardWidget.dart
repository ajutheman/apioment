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
      padding: const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 4),
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
                  Divider(height: 15),
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
                  // SizedBox(height: 10),
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
                  ' ',
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: MedicoControls.NormalNameTextCard(
                    'Name: ${schedule.patientName}',
                  ),
                ),
                // MedicoControls.NormalTextCard(
                //   ' ',
                // ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MedicoControls.NormalTextCard(
                  '${schedule.consultedDoctorName.split('|')[0] == "" ? 'Therapist Name' : 'Doctor Name'}: ${schedule.consultedDoctorName.replaceAll('|', '') ?? 'N/A'}',
                )
              ],
            ),
            const SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     MedicoControls.NormalTextCard(
            //       'Treatment Name  :  ${schedule.date ?? 'N/A'}',
            //     )
            //   ],
            // ),
            // SizedBox(height: 15),
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
