import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<Home> {
  CalendarController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();

}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: new Text("Ur Schedule"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: new Text("Riza"),
              accountEmail: new Text("riza@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage("https://code.byriza.com/lib/img/logo.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Item 1'),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Item 2'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.yellow,
                    selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white
                )
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toIso8601String());
            },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )
                ),
                todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )
                ),

              ),
              calendarController: _controller,
            )
          ],
        ),
      ),

      );
}
}