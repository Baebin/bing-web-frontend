enum AppImages {
  logo("logo", "png"),

  // Home Banner
  cloudLarge("cloud_large", "png"),
  cloudMedium("cloud_medium", "png"),
  flowers("flowers", "png"),
  seagull("seagull", "png"),
  seagulls("seagulls", "png"),
  palmTrees("palm_trees", "png"),
  beachItemOne("beach_item_one", "png"),
  beachItemTwo("beach_item_two", "png"),
  beachItemThree("beach_item_three", "png"),
  beachItemFour("beach_item_four", "png");

  final String name;
  final String ext;
  const AppImages(this.name, this.ext);

  String get path => "assets/images/$name.$ext";
}