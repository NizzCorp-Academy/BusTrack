part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class SubmitBooking extends BookingEvent {
  final Bus bus;
  final List<int> selectedSeats;

  SubmitBooking({required this.bus, required this.selectedSeats});
}
