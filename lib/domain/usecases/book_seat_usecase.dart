import 'package:bus_booking_app/domain/repositories/booking_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/bus_model.dart';

class BookSeatUseCase extends BookingRepository{
  Future<void> call({required Bus bus, required List<int> selectedSeats}) async {
    await FirebaseFirestore.instance.collection('bookings').add({
      'busName': bus.name,
      'from': bus.from,
      'to': bus.to,
      'departureTime': bus.departureTime,
      'selectedSeats': selectedSeats,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
  
  @override
  Future<void> bookSeats({required Bus bus, required List<int> selectedSeats}) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchBookingHistory() {
    throw UnimplementedError();
  }
}
