import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_manga_translation/presentation/utils/custom_colors.dart';
import 'package:simple_manga_translation/presentation/widgets/multiplier.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String projectName;
  final String creationDate;
  final double progress;
  final double width;
  final double height;
  final String extraIconAsset;
  final Function iconOnClick;

  const CustomCard(
      {Key? key,
      this.imagePath = '',
      required this.projectName,
      required this.creationDate,
      required this.extraIconAsset,
      required this.iconOnClick,
      this.width = double.infinity,
      this.height = double.infinity,
      required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        color: AppColors.projectCardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned(
                right: 20,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    iconOnClick();
                  },
                  child: MultiplierOnHover(
                    child: SvgPicture.asset(
                      extraIconAsset,
                      color: AppColors.ADDONS_AGTUNG,
                    ),
                  ),
                ),
              ),
              const Positioned(
                  left: 20,
                  top: 20,
                  child: Icon(
                    Icons.rounded_corner_outlined,
                    color: AppColors.projectIconColor,
                    size: 35,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        projectName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        creationDate,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w500, color: Color(0xBFffffff)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
