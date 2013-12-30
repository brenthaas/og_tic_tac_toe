# Tic-Tac-Toe

## Players

## Board

* The board is laid out as such:
1 2 3
4 5 6
7 8 9

* The Board is stored as a hash
* `null` represents an empty square
* symbols `:x` and `:o` represent occupied squares


### Perfect Game AI
1. Win: If you have two in a row, you can place a third to get three in a row.
2. Block: If the opponent has two in a row, you must play the third to block the opponent.
3. Fork: Create an opportunity where you have two threats to win (two non-blocked lines of 2).
4. Blocking an opponent's fork: If there is a configuration where the opponent can fork, you must block that fork.
5. Center: You play the center if open.
6. Opposite corner: If the opponent is in the corner, you play the opposite corner.
7. Empty corner: You play in a corner square.
8. Empty side: You play in a middle square on any of the 4 sides.

Find forks by looking at blank spaces, test a move, and see the weight change

Evaluate squares for X and for Y by having a mapping of square -> affected squares. When a move is done, update the value for x and y in affected squares (does this work?)
