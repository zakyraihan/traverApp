import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/home_controller.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/widget/favorite_widget.dart';
import 'package:travel_app/widget/judul_widget.dart';
import 'package:travel_app/widget/kategori_widget.dart';
import 'package:travel_app/widget/popular_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataKategori> data = [];

  getData() {
    HomeController().getKategori().then((value) {
      try {
        if (value != null) {
          log(value);
          setState(() {
            data = value;
          });
        } else {
          return null;
        }
      } catch (e) {
        log('error -> $e');
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void logOut() {
    AuthController().logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20),
              centerTitle: false,
              title: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 10),
                  Text(
                    'Hello, All',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notification_add))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Text(
                    'Where do You\nwant to explore today?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        label: Text('Search Destination'),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  JudulWidget(
                    judul: 'Choose Category',
                    link: 'see all',
                    onPressed: () => print('hello'),
                  ),
                  FutureBuilder(
                    future: HomeController().getKategori(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(data.length, (index) {
                              return KategoriWidget(
                                img: data[index].gambarKategori,
                                name: data[index].namaKategori,
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return const Scaffold();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  JudulWidget(
                      judul: 'Favorite Place',
                      onPressed: () {},
                      link: 'See All'),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FavoriteWidget(
                          img: 'assets/img/page1.jpg',
                          nama: 'kuta beach',
                          rating: 4.5,
                          tempat: 'bali, indonesia',
                        ),
                        FavoriteWidget(
                          img: 'assets/img/page2.jpg',
                          nama: 'kuta beach',
                          rating: 4.5,
                          tempat: 'bali, indonesia',
                        ),
                        FavoriteWidget(
                          img: 'assets/img/page3.jpg',
                          nama: 'kuta beach',
                          rating: 4.5,
                          tempat: 'bali, indonesia',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  JudulWidget(
                    judul: 'Popular Package',
                    onPressed: () {},
                    link: 'See All',
                  ),
                  const SizedBox(height: 20),
                  PopularWidget(
                    img: 'assets/img/page2.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    getData();
    super.dispose();
  }
}
