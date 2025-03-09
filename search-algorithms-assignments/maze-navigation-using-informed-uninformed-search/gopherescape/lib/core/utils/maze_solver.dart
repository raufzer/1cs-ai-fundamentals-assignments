import 'dart:collection';

class MazeSolver {
  // Maze grid: 0 => free, 1 => wall.
  static List<List<int>> buildGrid() {
    int rows = 8;
    int cols = 12;
    List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, 0));

    final wallColumns = [
      [1, 3, 5, 6, 7, 10],
      [1, 3, 7, 9, 10],
      [3, 5, 9, 10],
      [0, 2, 3, 5, 7, 9, 10],
      [0, 5, 7],
      [0, 1, 2, 4, 5, 7, 8, 9, 10, 11],
      [4, 5],
      [4, 5],
    ];

    for (int r = 0; r < rows; r++) {
      for (int c in wallColumns[r]) {
        grid[r][c] = 1;
      }
    }
    return grid;
  }

  static List<List<int>> buildGridFromUI(List<List<int>> wallColumns) {
    int rows = wallColumns.length;
    int cols = 12;
    List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, 0));

    for (int r = 0; r < rows; r++) {
      for (int c in wallColumns[r]) {
        grid[r][c] = 1;
      }
    }
    return grid;
  }

  static Map<String, dynamic> solveDFS({
    required List<List<int>> grid,
    required List<int> start,
    required List<int> goal,
  }) {
    int rows = grid.length;
    int cols = grid[0].length;
    List<List<bool>> visited = List.generate(
      rows,
      (_) => List.filled(cols, false),
    );
    List<List<List<int>?>> predecessor = List.generate(
      rows,
      (_) => List.filled(cols, null),
    );
    List<List<int>> visitedOrder = [];

    bool dfs(int r, int c) {
      visited[r][c] = true;
      visitedOrder.add([r, c]);

      if (r == goal[0] && c == goal[1]) return true;

      List<List<int>> directions = [
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1],
      ];
      for (var d in directions) {
        int nr = r + d[0], nc = c + d[1];
        if (nr < 0 ||
            nr >= rows ||
            nc < 0 ||
            nc >= cols ||
            grid[nr][nc] == 1 ||
            visited[nr][nc]) {
          continue;
        }
        predecessor[nr][nc] = [r, c];
        if (dfs(nr, nc)) return true;
      }
      return false;
    }

    bool found = dfs(start[0], start[1]);
    var result = _reconstructPath(found, predecessor, start, goal, visitedOrder);
    int nodesExplored = visitedOrder.length;
    int optimalPathLength = result['path']!.length;
    double searchEfficiency = (optimalPathLength / nodesExplored) * 100;

    return {
      'visited': visitedOrder,
      'path': result['path'],
      'nodesExplored': nodesExplored,
      'searchEfficiency': searchEfficiency,
      'optimalPathLength': optimalPathLength,
    };
  }

  static Map<String, dynamic> solveBFS({
    required List<List<int>> grid,
    required List<int> start,
    required List<int> goal,
  }) {
    int rows = grid.length;
    int cols = grid[0].length;
    List<List<bool>> visited = List.generate(
      rows,
      (_) => List.filled(cols, false),
    );
    List<List<List<int>?>> predecessor = List.generate(
      rows,
      (_) => List.filled(cols, null),
    );
    List<List<int>> visitedOrder = [];

    Queue<List<int>> queue = Queue();
    queue.add(start);
    visited[start[0]][start[1]] = true;

    bool found = false;
    while (queue.isNotEmpty) {
      var cell = queue.removeFirst();
      int r = cell[0], c = cell[1];
      visitedOrder.add([r, c]);
      if (r == goal[0] && c == goal[1]) {
        found = true;
        break;
      }
      for (var d in [
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1],
      ]) {
        int nr = r + d[0], nc = c + d[1];
        if (nr < 0 ||
            nr >= rows ||
            nc < 0 ||
            nc >= cols ||
            grid[nr][nc] == 1 ||
            visited[nr][nc]) {
          continue;
        }
        visited[nr][nc] = true;
        predecessor[nr][nc] = [r, c];
        queue.add([nr, nc]);
      }
    }
    var result = _reconstructPath(found, predecessor, start, goal, visitedOrder);
    int nodesExplored = visitedOrder.length;
    int optimalPathLength = result['path']!.length;
    double searchEfficiency = (optimalPathLength / nodesExplored) * 100;

    return {
      'visited': visitedOrder,
      'path': result['path'],
      'nodesExplored': nodesExplored,
      'searchEfficiency': searchEfficiency,
      'optimalPathLength': optimalPathLength,
    };
  }

  static Map<String, List<List<int>>> _reconstructPath(
    bool found,
    List<List<List<int>?>> predecessor,
    List<int> start,
    List<int> goal,
    List<List<int>> visitedOrder,
  ) {
    List<List<int>> path = [];
    if (found) {
      int r = goal[0], c = goal[1];
      while (!(r == start[0] && c == start[1])) {
        path.add([r, c]);
        var prev = predecessor[r][c];
        if (prev == null) break;
        r = prev[0];
        c = prev[1];
      }
      path.add(start);
      path = path.reversed.toList();
    }
    return {'visited': visitedOrder, 'path': path};
  }
}