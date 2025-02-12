class CategoryModel {
  final String id;
  final String imageName;

  CategoryModel({required this.id, required this.imageName});

  static List<CategoryModel> categories = [
    CategoryModel(id: "general", imageName: "general"),
    CategoryModel(id: "business", imageName: "business"),
    CategoryModel(id: "entertainment", imageName: "entertainment"),
    CategoryModel(id: "health", imageName: "health"),
    CategoryModel(id: "science", imageName: "science"),
    CategoryModel(id: "sports", imageName: "sports"),
    CategoryModel(id: "technology", imageName: "technology"),
  ];
}
