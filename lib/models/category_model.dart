import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name ;
  final String imgUrl ;

  Category({required this.name, required this.imgUrl});


  @override
  // TODO: implement props
  List<Object?> get props => [name,imgUrl];

  static List<Category> categories =[
    Category(name:'Soft Drinks', imgUrl:'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80' ),
    Category(
      name: 'Smoothies' ,imgUrl: 'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=408&q=80'
    ),
    Category(
      name: 'Water',imgUrl: 'https://images.unsplash.com/photo-1583228888267-f72a4d1558bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
    )
  ];


}