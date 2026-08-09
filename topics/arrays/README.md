# Learn MATLAB: arrays

Companion code for the YouTube video **"MATLAB Arrays Don't Start at Index
0."** Open these files in MATLAB and run them alongside the video.

## Files

| File | What it shows | Video timestamp (approx.) |
|---|---|---|
| `vector_basics.m` | The main 1D example: a week of temperature readings as a vector. Indexing with `(1)`/`(end)`, slicing with `2:4`, and growing the array with `end + 1`. | 0:23-1:00, 1:18-2:13 |
| `index_zero_error.m` | The myth-buster: `temps(0)` intentionally errors. Run it and read MATLAB's actual error message. | 1:00-1:18 |
| `matrix_basics.m` | The 2D example: three sensors, one week, as a matrix. Row/column indexing, `size`, and colon selection of a whole row or column. | 2:13-3:27 |
| `copy_semantics.m` | The copy myth: `M2 = M` makes an independent copy, not a shared reference. Modify `M2` and see `M` is untouched. | 3:27-3:42 |

Timestamps are approximate estimates from the narration script, not the
final edited video -- they'll drift slightly once the real audio is cut in.

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `vector_basics.m` first and read each output in the Command Window.
3. Run `index_zero_error.m` -- it's supposed to error. Read the message,
   don't fix it.
4. Run `matrix_basics.m`.
5. Run `copy_semantics.m` last.

## Challenge

In `matrix_basics.m`, add this line at the end:

```matlab
row = M(1, :);
row(1) = 999;
```

Before running it, work out by hand: does changing `row` also change `M`?
Then run it and check `M` in the Command Window. Post your prediction in
the video comments.
