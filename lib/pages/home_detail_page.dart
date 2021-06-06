import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catelog.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({Key? key, required this.catelog})
      // ignore: unnecessary_null_comparison
      : assert(catelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add to Cart".text.make(),
            ).wh(120, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            10.heightBox,
            Hero(
              tag: Key(catelog.id.toString()),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catelog.desc.text
                          .textStyle(context.captionStyle!)
                          .xl
                          .make(),
                      10.heightBox,
                      "Sea dolore et diam et ipsum et vero ea erat. Sed erat kasd sadipscing duo elitr sadipscing. Vero labore ipsum amet eos ut sea sit eos sed, nonumy at eos dolores lorem diam gubergren, no amet dolore sanctus stet consetetur, gubergren et eirmod kasd ipsum nonumy aliquyam takimata, kasd clita."
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p16()
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
