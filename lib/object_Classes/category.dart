class Category {
  int indexNumber;
  String name;

  Category (int indexNumber, String name) {
    this.indexNumber = indexNumber;
    this.name = name;
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