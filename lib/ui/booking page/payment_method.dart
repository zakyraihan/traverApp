import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/ui/booking%20page/booking_controller.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedIndex = -1;

  bool loading = false;

  Future<void> saveBooking(BuildContext context) async {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    setState(() {
      loading = true;
    });

    PaymentController()
        .bookingProses(
      data['id'],
      data['nama'],
      int.parse(data['jumlah']),
      data['contact'],
      data['tgl'],
      _selectedIndex,
    )
        .then((value) {
      if (value == null) {
        setState(() {
          loading = false;
        });
        Navigator.pushNamedAndRemoveUntil(
            context, "/booking-succes", (route) => false);
      } else {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "booking Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Detail Booking', style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                  future: PaymentController().getPayment(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      List<PaymentData> data = snapshot.data;

                      return Wrap(
                        runSpacing: 20,
                        children: List.generate(
                          data.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 30),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: _selectedIndex == index ? 2 : 0,
                                    color: _selectedIndex == index
                                        ? Colors.green
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(data[index].gambarPayment,
                                          height: 35),
                                      const SizedBox(width: 15),
                                      Text(
                                        data[index].namePayment,
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  _selectedIndex == index
                                      ? const Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.green,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return _buildShimmer(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 150,
                    child: Text(
                      data['total'].toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 19,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => saveBooking(context),
                child: Container(
                  width: lebar * 0.40,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 20,
        children: List.generate(
          10,
          (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 5),
                    Container(
                      height: 25,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}
