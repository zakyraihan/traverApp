import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

class BookingDate extends StatefulWidget {
  const BookingDate({super.key});

  @override
  State<BookingDate> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  DateTime? tanggal;
  String? tgl;
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Booking Date',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              DatePicker(
                maxDate: DateTime(2025),
                minDate: DateTime(2024),
                onDateSelected: (value) {
                  setState(() {
                    tanggal = value;
                    tgl = value.toString().substring(0, 10);
                    print(tgl);
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: lebar * 0.40,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Text('Back')),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/booking-detail',
                      arguments: {
                        'id': data['id'],
                        'hargawisata': data['hargawisata'],
                        'tanggal': tgl,
                      },
                    ),
                    child: Container(
                      width: lebar * 0.40,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text('Confirm'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
