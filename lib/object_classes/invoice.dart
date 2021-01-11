import 'dart:io';

class Invoice {
  double amountValue;
  int taxValue;
  int categoryNumber;
  String date;
  File photo;

  Invoice(this.amountValue, this.taxValue, this.date, this.categoryNumber,{this.photo});

  //Methods
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'amountValue': amountValue,
      'taxValue': taxValue,
      'categoryNumber': categoryNumber,
      'date': date,
      'photo': photo
    };
    return map;
  }

  Invoice.fromMap(Map<String, dynamic> map) {
    amountValue = map['amountValue'];
    taxValue = map['taxValue'];
    categoryNumber = map['categoryNumber'];
    date = map['date'];
    photo = map['photo'];
  }

  @override
  String toString() {
    return 'Invoice{amountValue: $amountValue, taxValue: $taxValue, date: $date, categoryNumber: $categoryNumber';
  }
}