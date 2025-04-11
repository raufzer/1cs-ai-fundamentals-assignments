import 'dart:async';
import 'package:flutter/material.dart';

mixin MazeAnimations<T extends StatefulWidget> on State<T> {
  int visitedAnimationIndex = 0;
  int finalPathAnimationIndex = 0;
  Timer? visitedTimer;
  Timer? finalPathTimer;

  bool showingVisited = true;
  bool showingFinalPath = false;

  void startVisitedAnimation(List<List<int>> visitedCells, VoidCallback updateState) {
    visitedTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (visitedAnimationIndex < visitedCells.length) {
        setState(() {
          visitedAnimationIndex++;
          updateState();
        });
      } else {
        timer.cancel();
        prepareForPathAnimation(updateState);
      }
    });
  }

  void prepareForPathAnimation(VoidCallback updateState) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showingVisited = false;
        showingFinalPath = true;
        finalPathAnimationIndex = 0;
        updateState();
      });
    });
  }

  void startFinalPathAnimation(List<List<int>> finalPath, VoidCallback updateState) {
    finalPathTimer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (finalPathAnimationIndex < finalPath.length) {
        setState(() {
          finalPathAnimationIndex++;
          updateState();
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    visitedTimer?.cancel();
    finalPathTimer?.cancel();
    super.dispose();
  }
}
