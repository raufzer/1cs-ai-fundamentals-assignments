import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher_escape_app/core/theme/app_colors.dart';
import 'package:gopher_escape_app/core/utils/app_assets.dart';
import 'tutorial_maze_constants.dart';

class TutorialMazeGrid extends StatelessWidget {
  final double containerSize;

  const TutorialMazeGrid({super.key, required this.containerSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: List.generate(8, (rowIndex) {
          return Padding(
            padding: EdgeInsets.only(bottom: rowIndex < 7 ? 4.h : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(12, (colIndex) {
                final shouldBeBlack = wallColumns[rowIndex].contains(colIndex);
                final isFirstColumnLastRow = rowIndex == 7 && colIndex == 0;
                final isLastColumnFirstRow = rowIndex == 0 && colIndex == 11;
                final key = '$rowIndex.$colIndex';
                final text = textMap[key];

                return Padding(
                  padding: EdgeInsets.only(right: colIndex < 11 ? 4.h : 0),
                  child: Container(
                    width: containerSize,
                    height: containerSize,
                    decoration: BoxDecoration(
                      color:
                          isFirstColumnLastRow
                              ? kSecondaryColor
                              : isLastColumnFirstRow
                              ? kAccentColor5
                              : shouldBeBlack
                              ? kAccentColor2
                              : kAccentColor1,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child:
                        isFirstColumnLastRow
                            ? Center(
                              child: Image.asset(
                                AssetsData.gopherEscapeStart,
                                width: containerSize * 0.8,
                                height: containerSize * 0.8,
                              ),
                            )
                            : text != null
                            ? Center(
                              child: Text(
                                text,
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: containerSize * 0.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                            : null,
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
