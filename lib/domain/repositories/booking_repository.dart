import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/bus_model.dart';

abstract class BookingRepository {
  Future<void> bookSeats({required Bus bus, required List<int> selectedSeats});
  Future<List<QueryDocumentSnapshot>> fetchBookingHistory();
}
