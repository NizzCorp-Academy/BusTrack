import 'package:bus_booking_app/data/models/bus_model.dart';
import 'package:bus_booking_app/domain/usecases/book_seat_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
    final BookSeatUseCase bookSeatUseCase;

  BookingBloc(this.bookSeatUseCase) : super(BookingInitial()) {
    on<SubmitBooking>(onSubmitBooking);
  }

  Future<void> onSubmitBooking(
    SubmitBooking event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());

    try {
      await bookSeatUseCase.call(bus: event.bus, selectedSeats: event.selectedSeats);
      emit(BookingSuccess(event.selectedSeats));
    } catch (e) {
      emit(BookingFailure('Failed to save booking: $e'));
    }
  }
}
