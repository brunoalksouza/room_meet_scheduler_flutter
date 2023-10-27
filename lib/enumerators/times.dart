enum Times {
  opt1(hour: "07:00"),
  opt2(hour: "07:30"),
  opt3(hour: "08:00"),
  opt4(hour: "08:30"),
  opt5(hour: "09:00"),
  opt6(hour: "09:30"),
  opt7(hour: "10:00"),
  opt8(hour: "10:30"),
  opt9(hour: "11:00"),
  opt10(hour: "11:30"),
  opt11(hour: "12:00"),
  opt12(hour: "12:30"),
  opt13(hour: "13:00"),
  opt14(hour: "13:30"),
  opt15(hour: "14:00"),
  opt16(hour: "14:30"),
  opt17(hour: "15:00"),
  opt18(hour: "15:30"),
  opt19(hour: "16:00"),
  opt20(hour: "16:30"),
  opt21(hour: "17:00"),
  opt22(hour: "17:30"),
  opt23(hour: "18:00"),
  opt24(hour: "18:30"),
  opt25(hour: "19:00");

  static List<String> getHours() {
    return Times.values.map((e) => e.hour).toList();
  }

  final String hour;

  const Times({required this.hour});
}
