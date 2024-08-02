import 'package:flutter/material.dart';
import 'package:flutter_app/themes.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'generated/l10n.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_app/event.dart';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return
     AdaptiveTheme(
         light: kLightTheme,
         dark: kDarkTheme,
         initial: AdaptiveThemeMode.dark,
         builder: (dark,light) =>
       MaterialApp(
         theme: light,
         darkTheme: dark,
         localizationsDelegates: [
         S.delegate,
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
         ],
         supportedLocales: S.delegate.supportedLocales,
         title: 'Flutter Demo',
         home: MyHomePage()
    )
     );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _eventController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon( Icons.change_circle_outlined, color: Theme.of(context).canvasColor,),
          onPressed: () {
          AdaptiveTheme.of(context).toggleThemeMode();
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),

      appBar: AppBar(
          title: Text(S.of(context).appBarTitle, style: TextStyle(backgroundColor: Theme.of(context).appBarTheme.backgroundColor, color: Theme.of(context).appBarTheme.foregroundColor)
          ),
      ),
      body: CalenderPlate()
    );
  }
}


class CalenderPlate extends StatefulWidget {
  const CalenderPlate({super.key});

  @override
  State<CalenderPlate> createState() => _CalenderPlateState();
}

class _CalenderPlateState extends State<CalenderPlate> {
  DateTime focuseday = DateTime.now();
  CalendarFormat _calenderformat = CalendarFormat.month;
  Map<DateTime, List<Event>> events = {};

  @override
  Widget build(BuildContext context) {
    return content();
  }

  void _OnDaySelected(DateTime day, DateTime focudedDay){
    setState(() {
      print("Selected Day = " + focudedDay.toString().split(" ")[0]);
      focuseday = day;
    });
  }

  Widget content()
  {
    return Column(children: [
      //Text(""),
      Container(
        child: TableCalendar(
          locale: "en_US",
          //headerStyle: HeaderStyle(formatButtonVisible: true),
          firstDay: DateTime.utc(2007, 01, 1),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focuseday,
          selectedDayPredicate: (day) => isSameDay(day, focuseday),
          onDaySelected: _OnDaySelected,
          calendarFormat: _calenderformat,
          onFormatChanged: (format)
          {
            if(_calenderformat != format)
              {
                setState(() {
                  _calenderformat = format;
                });
              }
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
            selectedTextStyle: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
            weekendTextStyle: TextStyle(color: Colors.red),
            holidayTextStyle: TextStyle(color: Colors.green),
          ),
        ),
      )]);
  }
}




//         theme: ThemeData(
//         colorScheme: ColorScheme.light(primary: Colors.deepOrange),),//theme  - тема для всего приложения
//       home: Scaffold(//база для множества объектов
//         appBar: AppBar(
//             title: Text('Верхний бар'),
//             centerTitle: true,
//             backgroundColor: Colors.deepOrange,),
//         body:
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text("Текст1"),Text("Текст2"),
//
//                 TextButton(onPressed: () {} ,child: Text("jkjkjkjkjkjH"))],),
//               Column(children: [Text("Текст1"),Text("Текст2"),
//                 TextButton(onPressed: () {} ,child: Text("H"))],)
//             ],
//           ),
//           //: Image( image:AssetImage('assets/HD.jpg'))
//           // ElevatedButton.icon(onPressed: () {},icon: Icon(Icons.timer), label: Text("Кнопка с иконкой"))
//             //ElevatedButton
//           // child: TextButton(
//           //   onPressed: () {},
//           //   style: TextButton.styleFrom(
//           //     //backgroundColor: Colors.deepOrange,
//           //
//           //     textStyle: TextStyle(fontSize: 16),
//           //   ),
//           //   child: Text("Нажми"),
//           // )
//           // Icon(Icons.adb_sharp, color: Colors.deepOrange, size: 244,),
//
//         floatingActionButton:
//       FloatingActionButton(
//         onPressed: () {
//           print("Clicked");
//         },
//           child: Text("Click"),
//         backgroundColor: Colors.deepOrange ,
//       )
//       ),
//     );
//   }
//
// }
