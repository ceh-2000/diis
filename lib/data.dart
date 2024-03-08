import 'garment.dart';

// Define hard-coded values for app demo
String user = "ceh210";

List<Garment> garments = [
  Garment("Jeans mini-skirt", "Skirt", "assets/images/garment_1.png", "ceh210", 2,
      "XS", 13),
  Garment("White sleeveless top", "White top", "assets/images/garment_2.png", "ceh210", 1,
      "S", 2),
  Garment(
      "Orange tank top", "Tank", "assets/images/garment_3.png", "ceh210", 2, "M", 12),
  Garment("Dodgers blue t-shirt", "Dodgers", "assets/images/garment_4.png", "sms227", 5,
      "XS", 4),
  Garment("Strapless green dress", "Dress", "assets/images/garment_5.jpg", "sms227", 3,
      "S", 1),
  Garment("Wide green trousers", "Trousers", "assets/images/garment_6.png", "sms227", 5,
      "M", 10),
  Garment("Light brown short-sleeve top", "Top", "assets/images/garment_7.png", "ceh210", 3,
      "L", 8),
];

List<GarmentPair> garmentPairs = [
  GarmentPair(garments[0], garments[1]),
  GarmentPair(garments[2], garments[3]),
  GarmentPair(garments[4], garments[5]),
  GarmentPair(garments[6], garments[1]),

];

