


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../models/Firebase_Models/data_model.dart';


 //  This function to catch all data from and to json model

CollectionReference<Data_Model> getDataModelCollections() {
  return FirebaseFirestore.instance.collection("data_model")
      .withConverter<Data_Model>(
      fromFirestore: (snapshot, SP) => Data_Model.fromJson(snapshot.data()!),
      toFirestore: (OneTask, SP) => OneTask.toJson());
}


Future<void> addTaskToFirebaseFirestore(Data_Model data_model){

  var collection  = getDataModelCollections();

  var docRef = collection.doc();

  data_model.id = docRef.id;

 return docRef.set(data_model);


}


Stream<QuerySnapshot<Data_Model>> getTaskFromFirebaseFirestore(DateTime dateTime){
  return getDataModelCollections().where('date',isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).snapshots();
}

Future<void> deleteTaskFromFirebaseFirestore(String id){
 return getDataModelCollections().doc(id).delete();
}
