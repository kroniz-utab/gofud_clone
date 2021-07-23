import 'package:flutter/material.dart';
import 'package:gofud_clone/data/banner_data.dart';
import 'package:gofud_clone/model/banner_model.dart';
import 'package:gofud_clone/resto_screen/resto_screen.dart';

class RestoCardMarkotop extends StatelessWidget {
  final restoName;
  final rating;
  final penilai;

  final resto;

  const RestoCardMarkotop({
    Key? key,
    required this.restoName,
    required this.rating,
    required this.penilai,
    required this.resto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RestoScreen(data: resto);
            },
          ),
        );
      },
      child: SizedBox(
        height: 170,
        width: 190,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/resto/default.jpg',
                        height: 100,
                        width: 190,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        restoName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restoName,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 3),
                          Text(
                            '$rating - $penilai rating',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconCardWidget extends StatelessWidget {
  final iconAssets;
  final iconTitle;

  const IconCardWidget({
    Key? key,
    required this.iconAssets,
    required this.iconTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              '$iconTitle\'s Menu Selected!',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.red),
            ),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: scaffold.hideCurrentSnackBar,
            ),
            backgroundColor: Colors.white,
          ),
        );
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        iconAssets,
                        height: 70,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                iconTitle,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bannerDataList.length,
        itemBuilder: (context, index) {
          final BannerModel banner = bannerDataList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(banner.bannerAssets),
              ),
              onTap: () {
                final scaffold = ScaffoldMessenger.of(context);
                scaffold.showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      '${banner.eventName} Promo Selected!',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.red),
                    ),
                    action: SnackBarAction(
                      label: 'Ok',
                      onPressed: scaffold.hideCurrentSnackBar,
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  SearchBox({
    Key? key,
    this.paddingVertical,
    this.paddingHorizontal,
  }) : super(key: key);

  final paddingVertical;
  final paddingHorizontal;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
        child: new Card(
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: TextField(
              controller: _textEditingController,
              decoration: new InputDecoration(
                hintText: 'Mau Makan Apa Hari ini?',
                border: InputBorder.none,
                fillColor: Colors.black,
              ),
            ),
            trailing: new IconButton(
              onPressed: () {
                _textEditingController.clear();
              },
              icon: new Icon(
                Icons.cancel,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UniversalContent extends StatelessWidget {
  final jarakResto;
  final rating;
  final categoryResto;
  final restoPlace;
  final restoName;
  final estMin;
  final estMax;

  final resto;

  const UniversalContent({
    Key? key,
    required this.jarakResto,
    required this.rating,
    required this.categoryResto,
    required this.restoPlace,
    required this.restoName,
    required this.estMin,
    required this.estMax,
    required this.resto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RestoScreen(data: resto);
                },
              ),
            );
          },
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'images/resto/default_cropped.jpg',
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          restoName,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '$restoName, $restoPlace',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 17,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                '$rating - $categoryResto',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: '$jarakResto km ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text: '($estMin - $estMax menit)',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
