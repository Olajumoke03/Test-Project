class CategoryListModel {
  String? categoryName;
  String? categoryId;

  CategoryListModel({this.categoryName, this.categoryId,});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['title'];
    categoryId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = categoryName;
    data['tag_id'] = categoryId;
    return data;
  }
}
