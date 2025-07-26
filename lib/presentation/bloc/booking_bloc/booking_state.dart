part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final List<int> seats;
  BookingSuccess(this.seats);
}

class BookingFailure extends BookingState {
  final String message;
  BookingFailure(this.message);
}
