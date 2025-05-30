import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
    : assert(catalog != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,

      bottomNavigationBar: Container(
        color: Colors.white,
        child:
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),

                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                  child: "Add to cart".text.make(),
                ).wh(130, 50),
              ],
            ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),

              child: Image.network(catalog.image),
            ).p16(),

            Expanded(
              child: VxArc(
                height: 10.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,

                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child:
                      Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "Justo et magna no et gubergren, sed elitr stet et ipsum sed ipsum invidunt. Lorem sanctus et sadipscing at sit sea invidunt, clita sit et ea eirmod dolore nonumy sed."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16(),
                        ],
                      ).py24(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
