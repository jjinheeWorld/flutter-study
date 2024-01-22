import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();

    // dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        /// 특정 사이즈를 설정했지만 위젯이 전체 영역을 차지하는 문제가 발생했다면
        /// 이는 플러터 프레임워크에서 해당 위젯을 어떻게 정렬해야 할지 모르기 때문에 발생한 문제이다.
        /// 정렬을 하면 문제가 해결된다!
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: textTheme.bodyText1,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
