import 'package:project_app2/object_classes/invoice.dart';

class Category {
  int indexNumber;
  String name;
  List<Invoice> invoiceList = List<Invoice>();

  Category (int indexNumber, String name) {
    this.indexNumber = indexNumber;
    this.name = name;
  }

  //Methods
  void addInvoice(Invoice invoice) {
    invoiceList.add(invoice);
    print('invoice added');
  }

  double amountSum() {
    double sum= 0;
    if (invoiceList != null) {
      for(int i = 0; i < invoiceList.length; i++) {
        sum += invoiceList[i].amountValue;
      }
      return double.parse(sum.toStringAsPrecision(2));
    }else {
      return 0;
    }
  }

  //Getters
  int getIndexNumber() {
    return this.indexNumber;
  }

  String getName() {
    return this.name;
  }

  //Setters
  void setIndexNumber(int indexNumber) {
    this.indexNumber = indexNumber;
  }

  void setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return 'Category{indexNumber: $indexNumber, name: $name}';
  }
}