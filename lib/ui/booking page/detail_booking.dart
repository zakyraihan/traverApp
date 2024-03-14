import 'package:flutter/material.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => BookingDetailState();
}

class BookingDetailState extends State<BookingDetail> {
  TextEditingController nama = TextEditingController(),
      contact = TextEditingController(),
      jumlah = TextEditingController(text: 1.toString());

  int total = 0;
  // String tanggal = '';

  @override
  void didChangeDependencies() {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    total = data['hargawisata'];

    print(data);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var lebar = MediaQuery.of(context).size.width;

    final int harga = data['hargawisata'];

    void calculate(int value) {
      int hargaValue = harga;

      total = value * hargaValue;

      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Detail Booking', style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      child: TextField(
                        controller: nama,
                        decoration: const InputDecoration(
                          label: Text('Nama'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 82, 79, 53)),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        controller: contact,
                        decoration: const InputDecoration(
                          label: Text('Contact'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 65,
                      child: TextField(
                        controller: jumlah,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              total = harga;
                            });
                          } else {
                            calculate(int.parse(value));
                          }
                        },
                        decoration: const InputDecoration(
                          label: Text('Jumlah'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
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
                          'Rp $total',
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
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/payment-methods',
                      arguments: {
                        'id': data['id'],
                        'namawisata': data['namawisata'],
                        'hargawisata': data['hargawisata'],
                        'nama': nama.text,
                        'tgl': data['tanggal'],
                        'jumlah': jumlah.text,
                        'contact': contact.text,
                        'total': total,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
