import 'package:project_app2/object_classes/invoice.dart';

class Category {
  int indexNumber;
  String name;
  List<int> invoiceNumber = List();
  // List<Invoice> invoiceList = List<Invoice>();

  Category (int indexNumber, String name) {
    this.indexNumber = indexNumber;
    this.name = name;
    this.invoiceNumber = List();
  }

  //Methods
  void addInvoice(Invoice invoice) {
    invoiceNumber.add(invoice.indexNumber);
    print('invoice added');
  }

  // double amountSum() {
  //   double sum= 0;
  //   if (invoiceNumber != null) {
  //     for(int i = 0; i < invoiceNumber.length; i++) {
  //       sum += invoiceNumber[i].amountValue;
  //     }
  //     return double.parse(sum.toStringAsPrecision(2));
  //   }else {
  //     return 0;
  //   }
  // }

  @override
  String toString() {
    return 'Category{indexNumber: $indexNumber, name: $name, invoiceNumberList length: ${invoiceNumber.length}';
  }
}