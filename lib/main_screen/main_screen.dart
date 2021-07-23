import 'package:flutter/material.dart';
import 'package:gofud_clone/data/resto_data.dart';
import 'package:gofud_clone/model/resto_model.dart';
import 'package:gofud_clone/widget/main_screen_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var _verticalPadding = 10.0;
  var _horizontalPadding = 10.0;

  final String _alamat = "Jl. Nangka Gg. Makam Cina No 34 Oro-Oro Ombo Batu";

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    List<String> menuBottomNav = ['Explore', 'Pencarian', 'Favorit'];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 1) {
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              '${menuBottomNav.elementAt(index)} was clicked',
              style: TextStyle(color: Colors.red),
            ),
            action: SnackBarAction(
              label: 'Close',
              onPressed: scaffold.hideCurrentSnackBar,
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // this for header
          buildHeader(),
          SizedBox(
            height: 10,
          ),
          // to call search box
          SearchBox(
            paddingVertical: _verticalPadding,
            paddingHorizontal: _horizontalPadding,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // call banner handler
                    BannerWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          IconCardWidget(
                            iconAssets: 'images/icon/map.png',
                            iconTitle: 'Terdekat',
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          IconCardWidget(
                            iconAssets: 'images/icon/insignia.png',
                            iconTitle: 'Rekomendasi',
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          IconCardWidget(
                            iconAssets: 'images/icon/discount.png',
                            iconTitle: 'Pasti Promo',
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          IconCardWidget(
                            iconAssets: 'images/icon/favorite.png',
                            iconTitle: 'Terfavorit',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resto Ter-Markotop',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hanya buat kamu, iya kamu :)',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 170,
                            width: 700,
                            child: GridView.count(
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 1,
                              crossAxisSpacing:
                                  MediaQuery.of(context).size.width * 0.01,
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.width * 0.01,
                              children: restoDataList
                                  .where((rec) => rec.isRecommended)
                                  .toList()
                                  .map((resto) {
                                return RestoCardMarkotop(
                                  restoName: resto.restoName,
                                  rating: resto.restoRating,
                                  penilai: resto.restoJudges,
                                  resto: resto,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resto Tersedia di Area Kamu',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Kami cariin yang dekat dan mantap lo!',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 15),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: restoDataList.length,
                            itemBuilder: (context, index) {
                              final RestoModel resto = restoDataList[index];
                              return UniversalContent(
                                jarakResto: resto.restoDistance,
                                rating: resto.restoRating,
                                categoryResto: resto.restoCategory.join(", "),
                                restoPlace: resto.restoLocation,
                                restoName: resto.restoName,
                                estMin: resto.estMinimum,
                                estMax: resto.estMaximum,
                                resto: resto,
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pencarian',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onTappedBottomNav,
      ),
    );
  }

  SafeArea buildHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: _verticalPadding,
          left: _horizontalPadding,
          right: _horizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.list_rounded,
              color: Colors.black45,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dikirim ke',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                        size: 18,
                      ),
                    ],
                  ),
                  Text(
                    _alamat,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.favorite_sharp,
              color: Colors.black45,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
