import 'package:cloud_firestore/cloud_firestore.dart';

class FetchBookingHistoryUsecase{
   Future<List<QueryDocumentSnapshot>> call() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs;
  }
}