import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardItem extends StatelessWidget {
  final GetData item;

  const CardItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = screenWidth * 0.3;
        double titleFontSize = screenWidth * 0.04;
        double priceFontSize = screenWidth * 0.035;
        double reviewFontSize = screenWidth * 0.032;

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.blueGrey, width: 2),
          ),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.network(
                      item.image ?? '',
                      height: imageHeight,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error, size: 60),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ImageIcon(
                        AssetImage("assets/images/icon_fav.png"),
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  item.title ?? 'No title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'EGP ${item.price?.toStringAsFixed(0) ?? '0'}',
                          style: TextStyle(
                            fontSize: priceFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${((item.price ?? 0) + 200).toStringAsFixed(0)} EGP',
                          style: TextStyle(
                            fontSize: priceFontSize * 0.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.blueGrey,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Review (${item.rating?.rate?.toStringAsFixed(1) ?? '0.0'})',
                          style: TextStyle(fontSize: reviewFontSize),
                        ),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage("assets/images/icon_add.png"),
                          color: Colors.indigo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
