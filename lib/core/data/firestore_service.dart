import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, T>> create<T>({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).set(data);
      return Right(fromJson(data));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  Future<Either<Failure, T>> read<T>({
    required String collection,
    required String docId,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final doc = await _firestore.collection(collection).doc(docId).get();
      if (!doc.exists) {
        return Left(NotFoundFailure('Document not found'));
      }
      return Right(fromJson(doc.data()!));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<T>>> readAll<T>({
    required String collection,
    required T Function(Map<String, dynamic>) fromJson,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>>)? queryBuilder,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(collection);
      if (queryBuilder != null) {
        query = queryBuilder(_firestore.collection(collection))!;
      }
      
      final snapshot = await query.get();
      final items = snapshot.docs.map((doc) => fromJson(doc.data())).toList();
      return Right(items);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> update({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);
      return const Right(null);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> delete({
    required String collection,
    required String docId,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
      return const Right(null);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  Stream<T> watchDocument<T>({
    required String collection,
    required String docId,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return _firestore
        .collection(collection)
        .doc(docId)
        .snapshots()
        .map((doc) => fromJson(doc.data()!));
  }
}
