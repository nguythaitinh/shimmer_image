library shimmer_image;

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProgressiveImage extends StatelessWidget {
	final String image;
	final BoxFit fit;
	final double height;
	final double width;
	final String? imageError;
	final Color baseColor;
	final Color highlightColor;
	
	const ProgressiveImage({
		Key? key,
		required this.image,
		required this.height,
		required this.width,
		this.fit = BoxFit.cover,
		this.imageError = 'assets/placeholder.jpeg',
		this.baseColor = const Color(0xFFF4F4F4),
		this.highlightColor = const Color(0xFFDADADA),
	}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Stack(children: [
			SizedBox(
				height: height,
				width: width,
				child: Shimmer.fromColors(
					baseColor: baseColor,
					highlightColor: highlightColor,
					child: Container(
						height: height,
						width: width,
						color: Colors.white,
					),
				),
			),
			FadeInImage.memoryNetwork(
				image: image,
				fit: fit,
				height: height,
				width: width,
				placeholder: kTransparentImage,
				imageErrorBuilder:
					(BuildContext context, Object error, StackTrace? stackTrace) =>
					Image.asset(
						imageError!,
						height: height,
						width: width,
						fit: BoxFit.cover,
					),
			),
		]);
	}
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
	0x89,
	0x50,
	0x4E,
	0x47,
	0x0D,
	0x0A,
	0x1A,
	0x0A,
	0x00,
	0x00,
	0x00,
	0x0D,
	0x49,
	0x48,
	0x44,
	0x52,
	0x00,
	0x00,
	0x00,
	0x01,
	0x00,
	0x00,
	0x00,
	0x01,
	0x08,
	0x06,
	0x00,
	0x00,
	0x00,
	0x1F,
	0x15,
	0xC4,
	0x89,
	0x00,
	0x00,
	0x00,
	0x0A,
	0x49,
	0x44,
	0x41,
	0x54,
	0x78,
	0x9C,
	0x63,
	0x00,
	0x01,
	0x00,
	0x00,
	0x05,
	0x00,
	0x01,
	0x0D,
	0x0A,
	0x2D,
	0xB4,
	0x00,
	0x00,
	0x00,
	0x00,
	0x49,
	0x45,
	0x4E,
	0x44,
	0xAE,
]);
