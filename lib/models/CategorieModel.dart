class CategorieModel {
  String categorieName;
  String categorieSvgIcon;

  List<String>? subCategoryType = [];
  CategorieModel({
    required this.categorieName,
    required this.categorieSvgIcon,
    this.subCategoryType,
  });
}

List<CategorieModel> categories = [
  CategorieModel(
    categorieName: "Apparel",
    categorieSvgIcon: "assets/All Categorie/Group 304.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
  CategorieModel(
    categorieName: "Shoes",
    categorieSvgIcon: "assets/All Categorie/Shoes.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
  CategorieModel(
    categorieName: "Watches",
    categorieSvgIcon: "assets/All Categorie/Watches.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
  CategorieModel(
    categorieName: "Toys",
    categorieSvgIcon: "assets/All Categorie/Toys.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
  CategorieModel(
    categorieName: "Beauty",
    categorieSvgIcon: "assets/All Categorie/Beauty.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
  CategorieModel(
    categorieName: "Sports",
    categorieSvgIcon: "assets/All Categorie/Sports.svg",
    subCategoryType: [
      "T-shirts",
      "Shirts",
      "Pants",
      "Socks &  Ties",
      "Underwear",
      "Jackets",
      "Coats",
      "Sweaters"
    ],
  ),
];
