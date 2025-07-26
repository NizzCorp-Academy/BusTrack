import 'package:bus_booking_app/data/models/bus_model.dart';
import 'package:bus_booking_app/domain/usecases/book_seat_usecase.dart';
import 'package:bus_booking_app/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:bus_booking_app/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusDetailsScreen extends StatelessWidget {
  final Bus bus;
  const BusDetailsScreen({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingBloc(BookSeatUseCase()),
      child: Scaffold(
        appBar: AppBar(title: Text(bus.name)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${bus.from}→${bus.to}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                'Departure Time: ${bus.departureTime}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Ticket Price: \$${bus.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Select Your Seat:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(child: SeatGrid(bus: bus)),
            ],
          ),
        ),
      ),
    );
  }
}

class SeatGrid extends StatefulWidget {
  final Bus bus;
  const SeatGrid({super.key, required this.bus});

  @override
  State<SeatGrid> createState() => _SeatGridState();
}

class _SeatGridState extends State<SeatGrid> {
  final List<bool> selectedSeats = List.generate(40, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: selectedSeats.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSeats[index] = !selectedSeats[index];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedSeats[index] ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.deepPurple),
                  ),
                  alignment: Alignment.center,
                  child: Text('Seat ${index + 1}'),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        BlocConsumer<BookingBloc, BookingState>(
          listener: (context, state) {
            if (state is BookingSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Booking confirmed: Seats ${state.seats.join(', ')}",
                  ),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            } else if (state is BookingFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    state is BookingLoading
                        ? null
                        : () {
                          final selected =
                              selectedSeats
                                  .asMap()
                                  .entries
                                  .where((entry) => entry.value)
                                  .map((entry) => entry.key + 1)
                                  .toList();

                          if (selected.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select at least one seat.',
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<BookingBloc>().add(
                            SubmitBooking(
                              bus: widget.bus,
                              selectedSeats: selected,
                            ),
                          );
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child:
                    state is BookingLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                          "Proceed",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
              ),
            );
          },
        ),
      ],
    );
  }
}
