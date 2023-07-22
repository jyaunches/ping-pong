# ping-pong
Exploring a ping pong game implementation.

--- Goal of Approach ---

Drive incremental development of implementation via unit tests to:
1. Allow unit tests to document the edgecases considered & covered
2. Not immediately implement a UI and the necessary event exchange between game loop & UI

Resulting Constraints
1. Timing & state synchronization is necessary to give the unit tests the control to examine the state of the game at certain moments. As such, the endless looping of the game loop (until a winner is found) does not provide the timing syncronization necessary. 

--- Decisions Made ---

1. Implement a game loop
2. Instead of the game loop looping endlessly, send in a an array of moves. Assume each move represents 1 advancing unit of time. (Conseptually, a second makes the most sense.. but this could be anything.)
3. Inside the game loop, for each time unit, process a move ()


--- Object Explanations ---

Move
- Represents the state of the left & right paddle for 1 unit of time.

Ball
- Represents the current coordinates & velocity of the ball in the game

Paddle
- Represents the current coordinates & velocity of the ball in the game for one object that can interact with the ball reversing it's trajectory

Board
- The grid the game operates in.
- When the ball crosses the boards boundaries, a player scores
