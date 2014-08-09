Mars Rover Problem
======

In this problem I have split up the functionality of the Grid class and the Rover class in the problem. Both these classes are tested separately and used within the Mars class for the specific problem. This is also tested itself, with the various inputs bundled in. Specifically, some particular cases are tested against. It is assumed all the rovers are deployed together at runtime, and both the edges of the grid and other rovers block sections of the map. If a rover tries to move to these blocked locations, it will maintain it's heading and remain stationary instead.

Quick start
------

To run the tests bundled into this directory:

1. Install ruby and the rspec gem if not installed,
  ```
  gem install rspec
  ```

2. To run the tests, run within the root directory:
  ```
  rspec spec
  ```

3. The output for the tests will be logged into the console.
