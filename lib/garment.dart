class Garment {
  String name;
  String short_name;
  String image_path;
  String owner;
  int owner_distance;
  String size;
  int num_wears;

  Garment(this.name, this.short_name, this.image_path, this.owner, this.owner_distance, this.size, this.num_wears);
}

class GarmentPair {
  Garment item1;
  Garment item2;

  GarmentPair(this.item1, this.item2);
}