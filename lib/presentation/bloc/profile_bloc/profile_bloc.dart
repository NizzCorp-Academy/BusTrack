import 'package:bus_booking_app/domain/usecases/booking_history_usecases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchBookingHistoryUsecase fetchBookingHistory;

  ProfileBloc({required this.fetchBookingHistory}) : super(ProfileInitial()) {
    on<LoadBookingHistory>(_onLoadBookingHistory);
  }

  Future<void> _onLoadBookingHistory(
      LoadBookingHistory event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final bookings = await fetchBookingHistory();
      emit(ProfileLoaded(bookings));
    } catch (e) {
      emit(ProfileError('Failed to load booking history: $e'));
    }
  }
}
