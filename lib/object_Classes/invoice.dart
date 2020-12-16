
import 'package:project_app2/object_Classes/category.dart';

class Invoice {
  double amountValue;
  int taxValue;
  Category category;
  String date;

  Invoice(this.amountValue, this.taxValue, this.category, this.date);

  //Getters
  double getAmountValue() {
    return this.amountValue;
  }

  int getTaxValue() {
    return this.taxValue;
  }

  Category getCategory() {
    return this.category;
  }

  String getDate() {
    return this.date;
  }

  //Setters
  void setAmountValue(double amountValue) {
    this.amountValue = amountValue;
  }

  void setTaxValue(int taxValue) {
    this.taxValue = taxValue;
  }

  void setCategory(Category category) {
    this.category = category;
  }

  void setDate(String date) {
    this.date = date;
  }

  @override
  String toString() {
    return 'Invoice{amountValue: $amountValue, taxValue: $taxValue, Category: {indexNumber: ${category.indexNumber}, name: ${category.name}}, date: $date}';
  }
}