import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/ui/booking%20page/booking_controller.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    await PaymentController().getBooking();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Your Trip',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: "Search destination",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: PaymentController().getBooking(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<BookingData> data = snapshot.data;

                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                width: 400,
                                height: 130, // Adjust the height as needed
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/ticket.png',
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: Text(
                                                    data[index].nameBooking,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Text(
                                                  data[index].contactBooking,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 70),
                                            Text(
                                              '${data[index].qtyBooking.toString()} orang',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Rp ${data[index].totalBooking.toString()}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.orange),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 18,
                                          ),
                                          Text(data[index]
                                              .dateBooking
                                              .toString()
                                              .substring(0, 10)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
