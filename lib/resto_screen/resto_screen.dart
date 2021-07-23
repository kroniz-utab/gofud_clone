import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gofud_clone/model/menu_model.dart';
import 'package:gofud_clone/model/resto_model.dart';
import 'package:gofud_clone/widget/resto_screen_widget.dart';

class RestoScreen extends StatelessWidget {
  // const RestoScreen({Key? key}) : super(key: key);

  final _verticalPadding = 10.0;
  final _horizontalPadding = 10.0;
  final RestoModel data;

  RestoScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: _verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      data.restoName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  FavoriteButton(),
                  SizedBox(width: 10),
                  Icon(
                    Icons.share,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
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
                    Text(
                      data.restoName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data.restoCategory.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // rating
                          RestoReviewWidget(
                            keterangan: '${data.restoJudges} Rating',
                            iconsValue: '${data.restoRating}',
                            iconsColor: Colors.orange,
                            icons: Icons.star,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // jarak
                          RestoReviewWidget(
                            keterangan: 'Jarak',
                            iconsValue: '${data.restoDistance} km',
                            iconsColor: Colors.redAccent[700],
                            icons: Icons.location_on,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // Harga
                          RestoReviewWidget(
                            keterangan: 'Harga',
                            iconsValue: '< ${data.restoEstPrice}',
                            iconsColor: Colors.redAccent[700],
                            icons: Icons.monetization_on,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          // Rasa
                          RestoReviewWidget(
                            keterangan: '100+ rating',
                            iconsValue: 'Rasa Mantap',
                            iconsColor: Colors.redAccent[700],
                            icons: Icons.thumb_up,
                          ),
                          VerticalDivider(
                            color: Colors.black54,
                            thickness: 0.6,
                            width: 25,
                          ),
                          RestoReviewWidget(
                            keterangan: '100+ rating',
                            iconsValue: 'Porsi Kuli',
                            iconsColor: Colors.redAccent[700],
                            icons: Icons.rice_bowl_rounded,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Menu Cuma Buat Kamu',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Iya kamu :)',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 0.5,
                      color: Colors.black26,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: data.restoMenu.length,
                      itemBuilder: (context, index) {
                        final MenuModel menu = data.restoMenu[index];
                        return menu.isFoodAvailable
                            ? MenuListAvailable(
                                foodImage: menu.foodImage,
                                foodName: menu.foodMenu,
                                foodDetail: menu.foodDescription,
                                foodPrice: menu.foodPrice,
                              )
                            : MenuListUnvailable(
                                foodImage: menu.foodImage,
                                foodName: menu.foodMenu,
                                foodDetail: menu.foodDescription,
                              );
                      },
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
