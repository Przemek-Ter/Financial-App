import 'package:project_app2/object_classes/category.dart';
import 'package:project_app2/object_classes/invoice.dart';

class CategoriesList {

  List<Category> categoriesList = [
    new Category(0, 'No Category'),
    new Category(1, 'Food'),
    new Category(2, 'Car'),
    new Category(3, 'Materials'),
  ];

  List<Category> getCategoryList() {
    return categoriesList;
  }

  void addToCategory(Invoice invoice, int categoryNumber) {
    categoriesList[categoryNumber].addInvoice(invoice);
  }

  double amountSum() {
    double sum = 0;
    for (int i = 0; i < categoriesList.length; i++) {
      sum += categoriesList[i].amountSum();
    }
    return double.parse(sum.toStringAsPrecision(2));
  }

  double percentOfAll(int categoryNumber) {
    double categorySum = categoriesList[categoryNumber].amountSum();
    double allSum = amountSum();
    return double.parse(((categorySum / allSum) * 100).toStringAsPrecision(2));
  }
}