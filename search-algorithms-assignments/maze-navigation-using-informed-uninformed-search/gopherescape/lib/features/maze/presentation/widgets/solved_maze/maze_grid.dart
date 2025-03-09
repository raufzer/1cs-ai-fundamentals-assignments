import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher_escape_app/core/theme/app_colors.dart';

class MazeGrid extends StatelessWidget {
  final List<List<int>> visitedCells;
  final List<List<int>> finalPath;
  final List<List<int>> mazeGrid;
  final int visitedAnimationIndex;
  final int finalPathAnimationIndex;
  final bool showingVisited;
  final bool showingFinalPath;

  const MazeGrid({
    super.key,
    required this.visitedCells,
    required this.finalPath,
    required this.mazeGrid,
    required this.visitedAnimationIndex,
    required this.finalPathAnimationIndex,
    required this.showingVisited,
    required this.showingFinalPath,
  });

  Color _getCellColor(int row, int col) {
    bool isStart = (row == 7 && col == 0);
    bool isEnd = (row == 0 && col == 11);
    bool isWall = mazeGrid[row][col] == 1;

    if (isStart) return kSecondaryColor;
    if (isEnd) return kAccentColor5;
    if (isWall) return kAccentColor2;

    if (showingFinalPath) {
      for (int i = 0; i < finalPathAnimationIndex; i++) {
        if (finalPath[i][0] == row && finalPath[i][1] == col) {
          return kAccentColor3;
        }
      }
    }

    if (showingVisited) {
      for (int i = 0; i < visitedAnimationIndex; i++) {
        if (visitedCells[i][0] == row && visitedCells[i][1] == col) {
          return kAccentColor4;
        }
      }
    }

    return kAccentColor1;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = (screenWidth - (11 * 4.w) - (2 * 16.w)) / 12;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: List.generate(8, (rowIndex) {
          return Padding(
            padding: EdgeInsets.only(bottom: rowIndex < 7 ? 4.h : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(12, (colIndex) {
                return Padding(
                  padding: EdgeInsets.only(right: colIndex < 11 ? 4.w : 0),
                  child: Container(
                    width: containerSize,
                    height: containerSize,
                    decoration: BoxDecoration(
                      color: _getCellColor(rowIndex, colIndex),
                      borderRadius: BorderRadius.circular(0),
                    ),
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
