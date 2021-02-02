import 'package:project_app2/object_classes/invoice.dart';

class Category {
  int indexNumber;
  String name;
  List<int> invoiceNumber = List();

  Category (int indexNumber, String name) {
    this.indexNumber = indexNumber;
    this.name = name;
    this.invoiceNumber = List();
  }

  void addInvoice(Invoice invoice) {
    invoiceNumber.add(invoice.indexNumber);
    print('invoice added');
  }

  @override
  String toString() {
    return 'Category{indexNumber: $indexNumber, name: $name, '
        'invoiceNumberList length: ${invoiceNumber.length}';
  }
}
