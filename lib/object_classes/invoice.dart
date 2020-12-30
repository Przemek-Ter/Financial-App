import 'dart:io';

class Invoice {
  double amountValue;
  int taxValue;
  int categoryNumber;
  String date;
  File photo;

  Invoice(this.amountValue, this.taxValue, this.date, this.categoryNumber,{this.photo});

  //Getters
  double getAmountValue() {
    return this.amountValue;
  }

  int getTaxValue() {
    return this.taxValue;
  }

  String getDate() {
    return this.date;
  }

  int getCategoryNumber() {
    return this.categoryNumber;
  }

  //Setters
  void setAmountValue(double amountValue) {
    this.amountValue = amountValue;
  }

  void setTaxValue(int taxValue) {
    this.taxValue = taxValue;
  }

  void setDate(String date) {
    this.date = date;
  }

  void setCategory(int categoryNumber) {
    this.categoryNumber = categoryNumber;
  }

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