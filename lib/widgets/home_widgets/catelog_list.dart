import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catelog.dart';
import 'package:flutter_catlog/pages/home_detail_page.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModel.items!.length,
        itemBuilder: (context, index) {
          final catelog = CatelogModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catelog: catelog)),
            ),
            child: CatelogItem(
              catelog: catelog,
            ),
          );
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      // ignore: unnecessary_null_comparison
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(
            image: catelog.image,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catelog.desc.text.textStyle(context.captionStyle!).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to Cart".text.make(),
                  ),
                ],
              ).pOnly(right: 8.0),
            ],
          ),
        ),
      ],
    )).white.rounded.square(150).make().py16();
  }
}
