import 'package:apioment/kaizenControls/MedButtonStyles.dart';
import 'package:apioment/kaizenControls/MedTextStyles.dart';
import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicoControls {
  static Widget textField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  static Widget PasswordtextField(
      TextEditingController controller, String label,
      {bool isPassword = true}) {
    return TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));
  }

  static Widget VerticalFiller(double height) {
    return Container(
      height: height,
      color: Colors.white, // Color of the box
    );
  }

  static Widget extraLargelabel(String text) {
    return Text(
      text,
      style: LargeFontStyle(Colors.white),
      softWrap: true,
      maxLines: 1,
    );
  }

  static Widget kaizenRetryButton(String text, Function() onpressed) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: MedButtonStyles.retryButtonStyle,
        onPressed: onpressed,
        child: Wrap(children: [
          /* Icon(
            iconname, SVG Cancel Type Icon here
          ), */
          Text(text)
        ]),
      ),
    );
  }

  static TextStyle LargeFontStyle(fntcolor) {
    return TextStyle(
        fontSize: 24, fontWeight: FontWeight.w400, color: fntcolor);
  }

  static Widget NormalLablel(String label) {
    return Text(label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
  }

  static Widget NormalLableltitle(String label) {
    return Text(label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            // backgroundColor: Colors.green,
            color: Medicolor.color1));
  }

  static Widget NormalLablelColor(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Color(0xFF164E63),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
    // Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14));
  }

  static Widget UserText(String therapistCode) {
    return Text(
      'clinicId: $therapistCode',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  static Widget clinicId(String therapistName) {
    return Text(
      'User: $therapistName',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  static Widget NormalText(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  static Widget CardinsideText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center, // Align text to center
      style: TextStyle(
        fontSize: 29,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  static Widget builCardinsideText() {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 90, top: 20, bottom: 30),
      child: MedicoControls.CardinsideText("AVAILABLE"),
    );
  }

  static Widget NormalTextCard(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 15.0,
        color: Medicolor.textcolorWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget NormalNameTextCard(String label) {
    int maxLines = label.length > 20 ? 2 : 1; // Adjust the threshold as needed

    return Text(
      label,
      style: TextStyle(
        fontSize: 15.0,
        color: Medicolor.textcolorWhite,
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      overflow:
          TextOverflow.ellipsis, // This will add ellipsis if text overflows
    );
  }

  /* static Widget qrViewButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Medicolor.color2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ConnectionPage(),
        ));
      },
      child: const Text('QR View'),
    );
  }*/

  static Widget ContactButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Medicolor.color2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Add your "Contact Us" functionality here
      },
      child: const Text('Contact Us'),
    );
  }

  static Widget LoginButton(Function onPressed, String label) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Medicolor.color1,
        ),
      ),
    );
  }

  /*static Widget qrViewTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConnectionPage(),
        ));
      },
      child: MedicoControls.NormalLablelColor('QR View'),
    );
  }*/

  static Widget searchButton({
    required VoidCallback? onPressed,
    required bool isEnabled,
  }) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 8,
          ),
          Text('Search   '),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isEnabled ? Medicolor.color2 : Medicolor.color6,
        ),
      ),
    );
  }

  static Widget searchTextField({
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search by patient name',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      onChanged: onChanged,
    );
  }

//  add file old file

  // static Widget textRow(String label,void Function(String)? onTextChanaged, {int itemsPerLine = 1,TextInputType inputType=TextInputType.text}) {
  //   return Row(
  //     children: [
  //       Expanded(
  //           flex: 1,
  //           child: InputWidget.QuestionText(label)
  //       ),
  //       Expanded(
  //         flex: 4,
  //         child: MedControls.textInputControl(onTextChanaged,inputType: inputType),
  //       ),
  //     ],
  //   );
  // }

  // ignore: non_constant_identifier_names
  // static Widget GetCard(BuildContext context, String Title, String Description,
  //     Widget widget, bool cardVisibility) {
  //   final Column title;
  //   if (Description == "") {
  //     title = Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           Title,
  //           style: MedTextStyles.cardTitleTextStyle(),
  //         )
  //       ],
  //     );
  //   } else {
  //     title = Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           Title,
  //           style: MedTextStyles.cardTitleTextStyle(),
  //         ),
  //         Text(Description, style: MedTextStyles.cardDetailsTextStyle())
  //       ],
  //     );
  //   }
  //
  //   return Visibility(
  //     visible: cardVisibility,
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(0),
  //       ),
  //       elevation: 8.0,
  //       shadowColor: Colors.transparent,
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         decoration: const BoxDecoration(
  //             gradient: MedGradients.containerFillGrandient),
  //         child: Column(
  //           children: [
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               decoration: const BoxDecoration(
  //                 gradient: MedGradients.containerFillGrandient,
  //                 boxShadow: [
  //                   BoxShadow(
  //                       color: Colors.grey,
  //                       blurRadius: 10,
  //                       spreadRadius: 1.0,
  //                       blurStyle: BlurStyle.outer //New
  //                   )
  //                 ],
  //               ),
  //               child: Padding(
  //                   padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
  //                   child: title),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(10),
  //               child: widget,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static Widget formView1(Map<String, String> items) {
  //   List<Padding> rows = [];
  //   items.forEach((key, value) => rows.add(Padding(
  //     padding: const EdgeInsets.all(3.0),
  //     child: Row(children: [
  //       Expanded(flex: 3, child: Text(key.toString())),
  //       Expanded(
  //           flex: 7,
  //           child: MedLayoutHelper.formViewTextBox(Text(
  //             value.toString(),
  //             style: MedTextStyles.cardInnerFontStyle(),
  //           )))
  //     ]),
  //   ))
  //   );
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: Column(children: rows),
  //   );
  // }

  // static Widget formView(Map<String, String> items, BuildContext context) {
  //   List<Column> rows = [];
  //   items.forEach((key, value) => rows.add(
  //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Text(key.toString()),
  //         SizedBox(
  //           width: MediaQuery.of(context).size.width * .90,
  //           child: Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
  //               child: MedLayoutHelper.formViewTextBox(
  //                 Text(value.toString(),
  //                     textAlign: TextAlign.left,
  //                     style: MedTextStyles.cardInnerFontStyle()),
  //               )),
  //         )
  //       ]))
  //   );
  //
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child:
  //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows),
  //   );
  // }

  // static Widget InputField(
  //     String label, onChange(String value), BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Text(label),
  //         MedLayoutHelper.widgetContainer(TextField(
  //           decoration: const InputDecoration(
  //               enabledBorder:
  //               UnderlineInputBorder(borderSide: BorderSide.none),
  //               focusedBorder: OutlineInputBorder(
  //                 borderSide: BorderSide.none,
  //               )),
  //           onChanged: (value) => onChange(value),
  //         ))
  //       ]));
  // }

  static Widget panConfirmButton(String text, Function() onpressed) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: MedButtonStyles.okButtonStyle,
        onPressed: onpressed,
        child: Wrap(children: [
          /*  Icon(
            iconname,// SGV Cancel icon here
          ), */
          Text(text)
        ]),
      ),
    );
  }

  static Widget panOutlineButton1(
      IconData iconname, String text, void Function()? onbtnPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style:
            //OutlinedButton.styleFrom(side: BorderSide(color: Colors.green)),
            MedButtonStyles.outlineButtonStyle,
        onPressed: onbtnPressed,
        child: Wrap(
          children: [
            Icon(
              size: 30,
              iconname,
              color: Medicolor.outlineButtonColor,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style:
                  MedTextStyles.buttonContentStyle(Medicolor.fontColorPrimary),
            )
          ],
        ),
        //child: Row(children[Text(text),Icon()]
      ),
    );
  }

  static Widget panOutlineButton(
      IconData iconname, String text, void Function()? onbtnPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
        style: MedButtonStyles.outlineButtonStyle,
        icon: Icon(
          size: 30,
          iconname,
          color: Medicolor.outlineButtonColor,
        ),
        onPressed: onbtnPressed,
        label: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            text,
            style: MedTextStyles.buttonContentStyle(Medicolor.fontColorPrimary),
          ),
        ),

        //child: Row(children[Text(text),Icon()]
      ),
    );
  }

  static Widget textInputControl(void Function(String)? onTextChanaged,
      {TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      onChanged: onTextChanaged,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 3, 214, 42), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 137, 214, 3), width: 2)),
      ),
    );
  }

  static Widget panRoundedTextbox(TextEditingController controller,
      [bool isPassword = false]) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 214, 3, 3), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 214, 3, 3), width: 2)),
      ),
    );
  }

  static Widget panTextfield(TextEditingController controller,
      [bool isPassword = false]) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          height: 39,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70),
                  borderSide: const BorderSide(
                      color: Medicolor.borderGreyColor, width: 2)),
            ),
          ),
        ));
  }

  static Widget panCheckboxControl(bool value, String text) {
    return Text(
      text,
      style: MedTextStyles.pageSubheadingFontStyle(Medicolor.fontColorPrimary),
    );
  }

  static Widget normallabelBold(String text) {
    return Text(
      text,
      style:
          MedTextStyles.pageSubheadingBoldFontStyle(Medicolor.fontColorPrimary),
    );
  }

  static Widget sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: MedGradients.containerFillGrandient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 1.0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: subTitle(text),
        ),
      ),
    );
  }

  static Widget subTitle(String text) {
    return Text(
      text,
      style: MedTextStyles.cardTitleTextStyle(),
    );
  }

  static Widget normallabel(String text) {
    return Text(
      text,
      style: MedTextStyles.pageSubheadingFontStyle(Medicolor.fontColorPrimary),
      softWrap: true,
      maxLines: 2,
    );
  }

  static Widget confirmationMessagebox(
      IconData iconname, String text, bool isvisible, BuildContext context) {
    return Visibility(
        visible: isvisible,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Medicolor.warningMessageBoxBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Medicolor.warningMessageBackColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                height: 40,
                width: 50,
                child: const Icon(Icons.warning_rounded),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .60,
                      child: Text(text,
                          style: MedTextStyles.cardInnerFontStyle())),
                ),
              )
            ]),
          ),
        ));
  }

  static Widget getConfirmationCard(
    BuildContext context,
    String text,
    String msg,
    Widget widget,
    bool isvisible,
  ) {
    return Visibility(
      visible: isvisible,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: MedGradients.containerFillGrandient),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: MedTextStyles.cardTitleTextStyle(),
                ),
                Text(
                  msg,
                  style: MedTextStyles.cardDetailsTextStyle(),
                ),
                widget
              ],
            ),
          )),
    );
  }

  static Widget okCancelButtons(BuildContext context, String okLabel,
      String cancelLabel, Function() okPressed, Function() cancelPressed) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: kaizenRetryButton(cancelLabel, cancelPressed),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: panConfirmButton(okLabel, okPressed),
        )
      ],
    );
  }
}

class DateSelectionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final DateTime selectedDate;

  const DateSelectionButton({
    required this.onPressed,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Medicolor.color1,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(0),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.calendar_month, color: Medicolor.color4),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: Text(
          DateFormat('yyyy-MM-dd').format(selectedDate),
          style: TextStyle(color: Medicolor.color4),
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all<Color>(Medicolor.color1),
        // ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const SearchButton({
    required this.onPressed,
    required this.isEnabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 8,
            ),
            Text('Search   '),
          ],
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all<Color>(
        //     isEnabled ? Colors.green : Colors.grey,
        //   ),
        // ),
      ),
    );
  }
}

class DateSelectionRow extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final VoidCallback? onForwardPressed;

  const DateSelectionRow({
    required this.selectedDate,
    required this.onDateSelected,
    this.onForwardPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 1.2,
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) {
                final date = selectedDate.add(Duration(days: index));
                return GestureDetector(
                  onTap: () {
                    onDateSelected(date);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: date.day == selectedDate.day
                            ? Medicolor.color3
                            : Medicolor.colortransparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(date),
                      style: TextStyle(
                        fontSize: 16,
                        color: Medicolor.color1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 6,
          color: Medicolor.color2,
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Medicolor.color2,
            ),
            onPressed: onForwardPressed,
          ),
        ),
      ],
    );
  }
}

class DoctorDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> doctorList;
  final String? selectedDoctorId;
  final Function(String) onChanged;

  const DoctorDropdown({
    required this.doctorList,
    required this.selectedDoctorId,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _DoctorDropdownState createState() => _DoctorDropdownState();
}

class _DoctorDropdownState extends State<DoctorDropdown> {
  late String _selectedDoctorId;

  @override
  void initState() {
    super.initState();
    _selectedDoctorId = widget.selectedDoctorId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 20),
      child: DropdownButton<String>(
        value: _selectedDoctorId,
        onChanged: (String? newValue) {
          setState(() {
            _selectedDoctorId = newValue!;
            widget.onChanged(_selectedDoctorId);
          });
          print('Selected Doctor ID: $_selectedDoctorId');
        },
        items: widget.doctorList.map<DropdownMenuItem<String>>((doctor) {
          return DropdownMenuItem<String>(
            value: doctor['appDoctDocNo'].toString(), // Ensure value is unique
            child: Text(doctor['consultedDoctorName']),
          );
        }).toList(),
      ),
    );
  }
}

class StatusChips extends StatelessWidget {
  const StatusChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
      child: Container(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 5),
            _buildChip(color: Medicolor.buildChipcolorgreen, label: 'Free'),
            SizedBox(width: 19),
            _buildChip(
                color: Medicolor.buildChipcolorblue, label: 'Appointment'),
            SizedBox(width: 19),
            _buildChip(color: Medicolor.buildChipcolorred, label: 'Block'),
          ],
        ),
      ),
    );
  }

  Widget _buildChip({required Color color, required String label}) {
    return Chip(
      shadowColor: Medicolor.Chipshadowcolors,
      // Colors.black,
      backgroundColor: Medicolor.ChipbackgroundColor,
      // Colors.white,
      avatar: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
        height: 20,
        width: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Medicolor.BorderSideColorPrimary, width: 1),
      ),
      label: Text(label),
    );
  }
}
// }
