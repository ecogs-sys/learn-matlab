# Learn MATLAB: arrays, part 2 (matrices)

Companion code for the YouTube video **"MATLAB Matrices: The Index Mistake
That Never Errors (Part 2)."** Part 1 (`../arrays-1d`) covers vectors,
indexing and the copy rule that everything here builds on.

Same running example as part 1, one dimension bigger: three sensors
logging the same week. Rows are sensors, columns are days.

## Files

| File | What it shows | Video timestamp (approx.) |
|---|---|---|
| `matrix_basics.m` | Building a matrix with `;`, then `size`, `[r,c] = size(M)`, `numel`, `zeros`/`ones`/`zeros(size(M))`. | 0:25-2:02 |
| `ragged_rows_error.m` | Rows of different lengths error on purpose -- plus the `NaN` placeholder for a genuinely missing reading. | 0:44-1:12 |
| `indexing_rows_cols.m` | `M(2,3)` row-then-column, the silent wrong answer from `M(3,2)`, whole rows/columns with `:`, and `end` per dimension. | 2:02-3:24 |
| `slicing_blocks.m` | Ranges in both slots: carving a sub-matrix out of a bigger one. | 3:24-3:44 |
| `growing_and_deleting.m` | Writing into a cell/row/column, adding rows and columns, and why deleting a single cell is an error. | 3:44-5:04 |
| `matrix_math.m` | `.*` vs `*`, transpose, and the big one: `sum(M)` works down columns, not across everything. | 5:04-7:05 |
| `copy_semantics.m` | `M2 = M` copies all 21 values; so does a block. How to write a block back in. | 7:05-7:47 |

Timestamps are estimates from the narration script, not the final edited
video -- they drift slightly once the real audio is cut in.

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run the files in the order listed above.
3. `ragged_rows_error.m` is meant to fail. Read the error, don't fix it.
4. In `growing_and_deleting.m` and `matrix_math.m`, uncomment the marked
   lines one at a time to see the two errors every first-year hits:
   the null-assignment error and "Incorrect dimensions for matrix
   multiplication".

## Challenge

From the video: `M` is 3x7. Before running anything, work out what

```matlab
size(sum(M, 2))
```

returns -- and why. Then check in the Command Window and post your answer
in the video comments.
