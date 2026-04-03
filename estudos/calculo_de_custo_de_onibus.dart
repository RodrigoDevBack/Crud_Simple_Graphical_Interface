void main() {
  int firstDay = 5;
  int month = 4;
  Map<String, int> weigthDefine = {
    'monday': 2,
    'tuesday': 3,
    'wednesday': 3,
    'thursday': 3,
    'friday': 3,
    'saturday': 2,
  };

  final nowFirstAndLastDay = CalcularTarifas.getNowFirstDayAndLastDay(
    month = month,
    firstDayDefine: firstDay,
  );
  final daysForPayment = CalcularTarifas.getDaysForPayment(
    nowFirstAndLastDay.first,
    nowFirstAndLastDay.last,
    weigthDefine,
  );
  final calcRates = CalcularTarifas.calcRates(daysForPayment);
  CalcularTarifas.printTotTariff(calcRates);
  CalcularTarifas.printForm(calcRates);
}

class CalcularTarifas {
  static List<DateTime> getNowFirstDayAndLastDay(
    int month, {
    int firstDayDefine = 1,
  }) {
    DateTime now = DateTime.now();

    DateTime firstDay = DateTime(now.year, month, firstDayDefine);
    DateTime lastDay = DateTime(now.year, month + 1, 0);

    List<DateTime> firstAndLastDay = [firstDay, lastDay];

    return firstAndLastDay;
  }

  static List<Map<String, dynamic>> getDaysForPayment(
    DateTime startOfMonth,
    DateTime endOfMonth,
    Map<String, int> weigthDefine,
  ) {
    List<Map<String, dynamic>> weekdaysAndWeigth = [];
    int? weigth;
    for (int day = startOfMonth.day; day <= endOfMonth.day; day++) {
      DateTime date = DateTime(startOfMonth.year, startOfMonth.month, day);

      switch (date.weekday) {
        case 1:
          {
            weigth = weigthDefine['monday'];
            break;
          }
        case 2:
          {
            weigth = weigthDefine['tuesday'];
            break;
          }
        case 3:
          {
            weigth = weigthDefine['wednesday'];
            break;
          }
        case 4:
          {
            weigth = weigthDefine['thursday'];
            break;
          }
        case 5:
          {
            weigth = weigthDefine['friday'];
            break;
          }
        case 6:
          {
            weigth = weigthDefine['saturday'];
          }
      }

      if (date.weekday >= 1 && date.weekday <= 6) {
        weekdaysAndWeigth.add({
          'year': date.year,
          'month': date.month,
          'day': date.day,
          'weigth': weigth,
        });
      }
    }
    return weekdaysAndWeigth;
  }

  static List<Map<String, dynamic>> calcRates(
    List<Map<String, dynamic>> weekdays,
  ) {
    List<Map<String, dynamic>> datesAndRates = weekdays;
    double totTariff = 0;
    for (int date = 0; date <= (weekdays.length - 1); date++) {
      totTariff += 2.25 * datesAndRates[date]['weigth'];

      datesAndRates[date]['tariff'] = 2.25 * datesAndRates[date]['weigth'];
      datesAndRates[date]['tot'] = totTariff;
    }
    return datesAndRates;
  }

  static void printForm(List<Map<String, dynamic>> datesAndRates) {
    for (int date = 0; date <= (datesAndRates.length - 1); date++) {
      print(datesAndRates[date]);
    }
  }

  static void printTotTariff(List<Map<String, dynamic>> datesAndRates) {
    double totTickets = 0;
    datesAndRates.forEach((element) {
      totTickets += element['weigth'];
    });
    print({
      'totTickets': totTickets.toInt(),
      'tot': datesAndRates[datesAndRates.length - 1]['tot'],
    });
  }
}
