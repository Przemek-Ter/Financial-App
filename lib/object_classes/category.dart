import 'package:project_app2/object_Classes/invoice.dart';

class Category {
  int indexNumber;
  String name;
  List<Invoice> invoiceList;

  Category (int indexNumber, String name) {
    this.indexNumber = indexNumber;
    this.name = name;
  }

  //Methods
  void addInvoice(Invoice invoice) {
    invoiceList.add(invoice);
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