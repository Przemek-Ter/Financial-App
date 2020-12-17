
class Invoice {
  double amountValue;
  int taxValue;
  int categoryNumber;
  String categoryName;
  String date;

  Invoice(this.amountValue, this.taxValue, this.categoryNumber, this.categoryName, this.date);

  //Getters
  double getAmountValue() {
    return this.amountValue;
  }

  int getTaxValue() {
    return this.taxValue;
  }

  int getCategoryNumber() {
    return this.categoryNumber;
  }

  String getCategoryName() {
    return this.categoryName;
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

  void setCategory(int categoryNumber) {
    this.categoryNumber = categoryNumber;
  }

  void setDate(String date) {
    this.date = date;
  }

  @override
  String toString() {
    return 'Invoice{amountValue: $amountValue, taxValue: $taxValue, categoryNumber: $categoryNumber, categoryName: $categoryName, date: $date}';
  }
}