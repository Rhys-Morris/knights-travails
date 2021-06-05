# The Odin Project: Knight Travails

## Description

This exercise was completed as part of coursework for [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails).

This program's task was to build a function knight_moves that shows the simplest possible way to get from one square to another on a chess board, by outputting all squares the knight will stop on along the way.

I solved this problem using a breadth-first approach, establishing a queue of nodes, represented as objects, to look at next until the target node was found. Each node in the queue was created with knowledge of the moves and path taken up until that point in time.

## Use

Run index.rb. This will generate 10 random start and finish positions and output the moves and path taken. A final test is included demonstrating that if start is equal to finish 0 moves will be outputted.

```rb
$ ruby index.rb
```
