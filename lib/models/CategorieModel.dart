class CategorieModel {
  String categorieName;
  String categorieSvgIcon;
  CategorieModel({
    required this.categorieName,
    required this.categorieSvgIcon,
  });
}

List<CategorieModel> categories = [
  CategorieModel(
      categorieName: "Apparel",
      categorieSvgIcon: "assets/All Categorie/Group 304.svg"),
  CategorieModel(
      categorieName: "Shoes",
      categorieSvgIcon: "assets/All Categorie/Shoes.svg"),
  CategorieModel(
      categorieName: "Watches",
      categorieSvgIcon: "assets/All Categorie/Watches.svg"),
  CategorieModel(
      categorieName: "Toys", categorieSvgIcon: "assets/All Categorie/Toys.svg"),
  CategorieModel(
      categorieName: "Beauty",
      categorieSvgIcon: "assets/All Categorie/Beauty.svg"),
  CategorieModel(
      categorieName: "Sports",
      categorieSvgIcon: "assets/All Categorie/Sports.svg"),
];
