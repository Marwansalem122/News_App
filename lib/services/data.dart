import '../model/category_model.dart';

List<CategoryModel>getCategories(){
  List images=[
    "business.jpg",
    "entertainment.jpg",
    "sports.jpg",
    "health.jpeg",
    "technology.jpg",
    "science.jpg"
  ];
  List names=[
    "Business",
    "Entertainment",
    "Sports",
    "Health",
    "Technology",
    "Science",
  ];
  List<CategoryModel>category=[];

  for(int i=0;i<images.length;i++){
    CategoryModel categorymodel=CategoryModel();
    categorymodel.categoryName=names[i];
    categorymodel.image="assets/images/${images[i]}";
    category.add(categorymodel);
  }

  return category;
}