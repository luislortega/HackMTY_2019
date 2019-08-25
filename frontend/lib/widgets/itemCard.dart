import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String product, price, image, supermarket;
  const ItemCard({Key key, this.product, this.price, this.image, this.supermarket})
      : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product),
      contentPadding: EdgeInsets.only(bottom: 10, right: 10),
      trailing: Text(
        widget.price,
        style: TextStyle(color: Color(0xff49FE5B), fontSize: 15),
      ),
      leading: InkWell(
        child: new Container(
          height: 45,
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ),
      subtitle: Text(widget.supermarket),
    );
  }
}