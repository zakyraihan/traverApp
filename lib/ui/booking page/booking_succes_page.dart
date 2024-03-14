import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSuccesPage extends StatelessWidget {
  const BookingSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:
                    Image.asset('assets/img/payment_succes.jpg', height: 200),
              ),
              const SizedBox(height: 40),
              Text(
                'Booking\nSuccesfully',
                style: GoogleFonts.poppins(
                    fontSize: 33, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Text(
                "Get everything ready until it's time to go on a trip",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
                  child: Text(
                    'Explore other places',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
