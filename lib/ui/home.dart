import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/common/result_state.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/kategori_controller.dart';
import 'package:travel_app/widget/favorite_widget.dart';
import 'package:travel_app/widget/judul_widget.dart';
import 'package:travel_app/widget/kategori_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void logOut() {
    AuthController().logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            JudulWidget(
                judul: 'Choose Category', onPressed: () {}, link: 'See All'),
            _buildListKategori(context),
            const SizedBox(height: 20),
            JudulWidget(
                judul: 'Favorite Place', onPressed: () {}, link: 'Explore'),
            _buildFavoriteList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildListKategori(BuildContext context) {
    return Consumer<KategoriProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return _buildKategoriShimmer(context);
        } else {
          if (state.state == ResultState.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(top: 12),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 15,
                children: List.generate(state.result.data.length, (index) {
                  return KategoriWidget(
                    name: state.result.data[index].namaKategori,
                    img: state.result.data[index].gambarKategori,
                  );
                }).toList(),
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.error) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  IconButton(
                    onPressed: () =>
                        context.read<KategoriProvider>().fetchKategoriData(),
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
            );
          } else {
            return const Scaffold();
          }
        }
      },
    );
  }

  Widget _buildFavoriteList(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 12),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 15,
        children: List.generate(
          3,
          (index) => FavoriteWidget(
            img: 'assets/img/page1.jpg',
            nama: 'Bromo Mountain',
            tempat: 'null, indonesia',
            rating: 4.5,
          ),
        ),
      ),
    );
  }

  Widget _buildKategoriShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 15,
            children: List.generate(10, (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 17),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        width: 50,
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
