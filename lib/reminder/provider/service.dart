import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pill_mate/reminder/model/model.dart';
import 'package:pill_mate/reminder/service.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todo')
      .snapshots()
      .map((event) => event.docs
      .map((snapshot) => TodoModel.fromSnapshot(snapshot))
      .toList());
  yield* getData;
});