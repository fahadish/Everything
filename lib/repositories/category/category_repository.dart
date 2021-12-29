import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everything/models/category_model.dart';
import 'package:everything/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore}):
      _firebaseFirestore = firebaseFirestore?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
return _firebaseFirestore.collection('categories').snapshots().map((snapshot) {
  return snapshot.docs.map((doc) =>Category.fromSnapshot(doc) ).toList();
});
  }

}