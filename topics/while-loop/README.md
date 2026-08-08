# Learn MATLAB: while loop

Companion code for the YouTube video **"How the MATLAB while loop actually
works."** Open these files in MATLAB and run them alongside the video.

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `savings_goal.m` | The main example: a balance grows with interest each pass until it reaches a goal. Trace it by hand first, then run it and compare. | 1:50-3:00 |
| `savings_goal_zero_iterations.m` | Same code, one number changed (`balance = 1500`). The condition is false on the very first check, so the loop body never runs. | 3:00-3:20 |
| `savings_goal_infinite_bug.m` | The classic mistake: the line that updates `balance` is commented out, so the loop never stops. **Runs forever until you stop it.** | 3:20-4:00 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `savings_goal.m` first (type its name, minus `.m`, at the Command
   Window, or click Run in the Editor).
3. Try `savings_goal_zero_iterations.m`.
4. Run `savings_goal_infinite_bug.m` last. It will print forever -- click
   into the Command Window and press **Ctrl+C** to stop it. That's the
   only way out; it isn't frozen, it's just checking a condition that can
   never become false.

## Challenge

In `savings_goal.m`, change `goal` to `900`. Before you run it, work out by
hand:

- How many iterations will run?
- What will the final value of `balance` be?

Then run it in MATLAB and check your answer. Post your prediction in the
video comments.
