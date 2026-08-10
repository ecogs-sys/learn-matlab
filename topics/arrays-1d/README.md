# Learn MATLAB: arrays, part 1 (vectors)

Companion code for the YouTube video **"MATLAB Counts From 1, Not 0 --
Vectors From Scratch (Part 1)."** Open these in MATLAB and run them
alongside the video. Part 2 (`../arrays-2d`) takes the same data into two
dimensions.

Everything here uses one running example: a week of temperature readings
from a single sensor.

## Files

| File | What it shows | Video timestamp (approx.) |
|---|---|---|
| `vector_basics.m` | Building the vector, reading one element, `end`, and `length`/`numel`/`size`. | 0:30-2:35 |
| `index_zero_error.m` | The myth-buster: `temps(0)` errors on purpose. Run it and read the message. | 1:17-1:42 |
| `slicing_and_end.m` | Taking several elements at once: `2:4`, `5:end`, and `start:step:stop` including a negative step. | 2:35-3:22 |
| `creating_vectors.m` | Building vectors without typing values: `1:7`, `zeros`, `ones`, `linspace`, and why you would preallocate. | 3:22-3:50 |
| `growing_and_deleting.m` | Writing into an element or a range, growing with `end + 1`, joining with `[a b]`, deleting with `= []`. | 3:50-5:26 |
| `vector_math.m` | Whole-vector arithmetic with no loop, `.*` vs `*`, `sum`/`mean`/`max`, and selecting by condition. | 5:26-7:08 |
| `copy_semantics.m` | `t2 = temps` makes an independent copy -- and so does a slice. | 7:08-7:47 |

Timestamps are estimates from the narration script, not the final edited
video -- they drift slightly once the real audio is cut in.

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run the files in the order listed above, reading each Command Window
   output before moving on.
3. `index_zero_error.m` is meant to fail. Read the error, don't fix it.

## Challenge

From the video:

```matlab
temps = [68 72 75 70 65 60 58];
temps(4) = [];
```

Before you run it, work out by hand: what is `temps(4)` now? Then check in
the Command Window, and post your prediction in the video comments.
