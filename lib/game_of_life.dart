import 'dart:math';

class GameOfLife {
  GameOfLife(this.size);

  final int size;

  Stream<List<List<bool>>> call([
    Duration duration = const Duration(milliseconds: 50),
  ]) async* {
    final List<List<bool>> grid = <List<bool>>[];

    _initGrid(grid);

    while (true) {
      _updateGrid(grid);

      yield grid;
      await Future<void>.delayed(duration);
    }
  }

  void _initGrid(List<List<bool>> grid) {
    grid.clear();

    for (int i = 0; i < size; i++) {
      grid.add(<bool>[]);

      for (int j = 0; j < size; j++) {
        grid[i].add(Random().nextBool());
      }
    }
  }

  void _updateGrid(List<List<bool>> grid) {
    final List<List<bool>> nextGrid = <List<bool>>[];

    for (int i = 0; i < size; i++) {
      nextGrid.add(<bool>[]);

      for (int j = 0; j < size; j++) {
        final bool alive = grid[i][j];
        final int aliveNeighbors = _aliveNeighbors(i, j, grid);

        if (alive && (aliveNeighbors == 2 || aliveNeighbors == 3)) {
          nextGrid[i].add(true);
        } else if (!alive && aliveNeighbors == 3) {
          nextGrid[i].add(true);
        } else {
          nextGrid[i].add(false);
        }
      }
    }

    grid
      ..clear()
      ..addAll(nextGrid);
  }

  int _aliveNeighbors(int i, int j, List<List<bool>> grid) {
    int aliveNeighbors = 0;

    final List<List<int>> neighbors = <List<int>>[
      <int>[-1, -1],
      <int>[0, -1],
      <int>[1, -1],
      <int>[1, 0],
      <int>[1, 1],
      <int>[0, 1],
      <int>[-1, 1],
      <int>[-1, 0],
    ];

    for (final List<int> neighbor in neighbors) {
      final int x = _checkBoundry(i + neighbor.first);
      final int y = _checkBoundry(j + neighbor.last);

      if (grid[x][y]) {
        aliveNeighbors++;
      }
    }

    return aliveNeighbors;
  }

  int _checkBoundry(int value) {
    if (value < 0) {
      return size - 1;
    } else if (value > size - 1) {
      return 0;
    }

    return value;
  }
}
