import 'package:apioment/applicationbloc/ApplicationBloc.dart';
import 'package:apioment/applicationbloc/ApplicationEvents.dart';
import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:apioment/kaizenwidgects/ScheduleCardWidget.dart';
import 'package:apioment/models/PatientSchedule.dart';
import 'package:apioment/models/doctorModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppointmentView extends StatelessWidget {
  final BuildContext applicationContext;
  final List<PatientSchedule> Schedules;
  final List<DoctorModel> doctors;
  final String SelectedDoctorId;
  final DateTime selectedDate;
  AppointmentView(this.Schedules, this.doctors, this.applicationContext,
      this.SelectedDoctorId, this.selectedDate,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: MedicoControls.NormalLableltitle('Booking Schedules'),
        backgroundColor: Medicolor.color2,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your logout logic here
              BlocProvider.of<ApplicationBloc>(context).add(LogoutEvent());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                // Expanded(
                //   child: MedicoControls.NormalText("Select Date"),
                // ),
                DropdownButton<DoctorModel>(
                  value: SelectedDoctorId != null
                      ? doctors.firstWhere(
                          (doctor) => doctor.empDocNo == SelectedDoctorId)
                      : null, // Get doctor object based on ID
                  onChanged: (newValue) {
                    BlocProvider.of<ApplicationBloc>(context).add(
                      SearchScheduleEvent(selectedDate, newValue!.empDocNo),
                    );
                  },
                  items: doctors
                      .map((doctor) => DropdownMenuItem<DoctorModel>(
                            value: doctor,
                            child: Text(doctor.employeeName),
                          ))
                      .toList(),
                ),
                SizedBox(width: 80),
                DateSelectionButton(
                  onPressed: () =>
                      _selectDate(context, selectedDate, (newDate) {
                    // selectedDate = newDate;
                    // futureSchedules = fetchData(selectedDate, selectedDoctorId!);
                    BlocProvider.of<ApplicationBloc>(context)
                        .add(SearchScheduleEvent(newDate, SelectedDoctorId));
                  }),
                  selectedDate: selectedDate,
                ),
              ],
            ),
          ),
          // SizedBox(height: 2),
          // Padding(
          //   padding: const EdgeInsets.all(1.0),
          //   child: Row(
          //     children: [
          //       // DateSelectionButton(
          //       //   onPressed: () =>
          //       //       _selectDate(context, selectedDate, (newDate) {
          //       //     // selectedDate = newDate;
          //       //     // futureSchedules = fetchData(selectedDate, selectedDoctorId!);
          //       //     BlocProvider.of<ApplicationBloc>(context)
          //       //         .add(SearchScheduleEvent(newDate, SelectedDoctorId));
          //       //   }),
          //       //   selectedDate: selectedDate,
          //       // ),
          //       SizedBox(width: 90),
          //       SearchButton(
          //         onPressed: SelectedDoctorId != null && selectedDate != null
          //             ? () async {
          //                 try {
          //                   BlocProvider.of<ApplicationBloc>(context).add(
          //                       SearchScheduleEvent(
          //                           selectedDate, SelectedDoctorId));
          //                 } catch (e) {
          //                   print('Error fetching data: $e');
          //                 }
          //               }
          //             : null,
          //         isEnabled: SelectedDoctorId != null && selectedDate != null,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 14,
                color: Colors.green,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white),
                  onPressed: () {
                    var newDate = selectedDate.add(Duration(days: -1));
                    BlocProvider.of<ApplicationBloc>(applicationContext)
                        .add(SearchScheduleEvent(newDate, SelectedDoctorId
                            //  ApplicationConfig.DefaultDoctor
                            ));
                  },
                ),
              ),
              Expanded(
                // Wrap the Container in Expanded
                child: Container(
                  height: 48,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) {
                        final date = selectedDate.add(Duration(days: index));
                        return GestureDetector(
                          onTap: () {
                            // selectedDate = date;
                            // BlocProvider.of<ApplicationBloc>(context)
                            //     .add(SearchScheduleEvent(date, SelectedDoctorId));
                            var newDate = selectedDate.add(Duration(days: 1));
                            BlocProvider.of<ApplicationBloc>(applicationContext)
                                .add(SearchScheduleEvent(
                                    newDate, SelectedDoctorId));
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: date.day == selectedDate.day
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              DateFormat('yyyy-MM-dd').format(date),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 14,
                color: Colors.green,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                    onPressed: () {
                      var newDate = selectedDate.add(Duration(days: 1));
                      BlocProvider.of<ApplicationBloc>(applicationContext)
                          .add(SearchScheduleEvent(newDate, SelectedDoctorId
                              //  ApplicationConfig.DefaultDoctor
                              ));
                    },
                  ),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 8),
          StatusChips(),
          Expanded(
              child: ListView.builder(
                  itemCount: Schedules.length,
                  itemBuilder: (context, index) {
                    return ScheduleCardWidget(schedule: Schedules[index]);
                  })),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context, DateTime selectedDate,
      Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }
}
