import 'package:flutter/material.dart';


class CustomDateField extends StatefulWidget {
  final String label;

  const CustomDateField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  Future<void> _selectDate(BuildContext context) async {
    // DateTime? picked = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(1900),
    //   lastDate: DateTime(2100),
    // );

    // if (picked != null) {
    //   widget..text = DateFormat("yyyy-MM-dd").format(picked);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(widget.label,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    SizedBox(height: 5,),
    TextField(

    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
    hintText: 'dd/mm/yyyy',
      hintStyle: TextStyle(color: Colors.grey),
    focusedBorder:OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black)
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    suffixIcon: IconButton(
    icon: Icon(Icons.calendar_today),
    onPressed: () => _selectDate(context),
    ),
    ),
    ),
    ]
    ,
    );
  }
}
