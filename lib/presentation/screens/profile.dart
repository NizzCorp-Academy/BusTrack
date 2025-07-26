import 'package:bus_booking_app/domain/usecases/booking_history_usecases.dart';
import 'package:bus_booking_app/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:bus_booking_app/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(fetchBookingHistory: FetchBookingHistoryUsecase())..add(LoadBookingHistory()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Profile'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      "Mohammed Rashim",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          'Phone: +91 9207298504',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Email: rasim@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'My Bookings :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProfileError) {
                      return Center(child: Text(state.message));
                    } else if (state is ProfileLoaded) {
                      final bookings = state.bookings;

                      if (bookings.isEmpty) {
                        return Center(child: Text('No bookings found.'));
                      }
                    return ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        final booking = bookings[index];
                        final busName = booking['busName'] ?? '';
                        final from = booking['from'] ?? '';
                        final to = booking['to'] ?? '';
                        final departureTime = booking['departureTime'] ?? '';
                        final selectedSeats = List<int>.from(
                          booking['selectedSeats'] ?? [],
                        );
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                              '$busName ($from → $to)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Departure: $departureTime\nSeats: ${selectedSeats.join(', ')}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              Icons.directions_bus,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
