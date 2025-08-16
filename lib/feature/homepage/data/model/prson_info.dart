class PersonInfoModel {
  final String name;
  final String desc;
  final String image;   
   int? numOfMessage ;

  PersonInfoModel({
    required this.name,
    required this.desc,
    required this.image,
    this.numOfMessage=0,

  });
}
