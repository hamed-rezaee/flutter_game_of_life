# Game of Life in Flutter

This is a simple implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in Flutter, a cellular automaton simulation. The code includes a custom painter to visualize the game grid and a class to manage logic.

![Game of Life in Flutter](game_of_life.gif)

### How to Use

Once the application is running, you will see the Game of Life simulation displayed on the screen. Here's how to interact with it:

- The grid represents the cells in the Game of Life.
- Cells can be in one of two states: alive (red) or dead (black).
- The initial state of the grid is randomized.
- The simulation will automatically update at a predefined interval.

### Customization

You can customize the following aspects of the simulation:

**Grid Size:** The grid size can be adjusted by changing the `size` parameter in the `MainApp` widget in `main.dart`. For example, `GameOfLife(85)` creates an 85x85 grid.

**Update Interval:** You can change the update interval by modifying the `Duration` passed to the `GameOfLife` stream in `main.dart`. For example, to increase the update interval to 50 milliseconds, use `Duration(milliseconds: 50)`.

**Cell Appearance:** You can customize the appearance of live and dead cells by modifying the `GameOfLifePainter` class in `game_of_life_painter.dart`. You can change the colors and styles used to paint cells.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
