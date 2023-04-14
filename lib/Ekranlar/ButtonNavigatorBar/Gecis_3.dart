import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Gecis_3 extends StatefulWidget {
  const Gecis_3({Key? key}) : super(key: key);

  @override
  State<Gecis_3> createState() => _Gecis_3State();
}

class _Gecis_3State extends State<Gecis_3> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YAPILACAKLAR"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              rowHeight: 55,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 10),
              lastDay: DateTime.utc(2031, 2, 28),
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
