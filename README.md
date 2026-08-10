# Learn MATLAB

Companion code for the "Learn MATLAB" YouTube series. Each video gets its
own folder under `topics/`, with runnable `.m` files and a topic-specific
README that maps files to video timestamps.

## Topics

| Topic | Folder | What it covers |
|---|---|---|
| while loop | [`topics/while-loop`](topics/while-loop) | How `while` actually evaluates: check, run the whole body, check again. Zero-iteration case and the classic infinite-loop bug. |
| arrays, part 1 (vectors) | [`topics/arrays-1d`](topics/arrays-1d) | 1-based indexing, `end`, colon slicing with `start:step:stop`, building with `1:7`/`zeros`, growing and deleting, whole-vector math, `.*` vs `*`, `sum`/`mean`/`max`, and copy-by-value. |
| arrays, part 2 (matrices) | [`topics/arrays-2d`](topics/arrays-2d) | Rows and columns: building with `;`, `size`, row-then-column indexing (and the silent wrong answer), sub-blocks, adding/deleting rows, transpose, and why `sum(M)` is one total per column. |

More topics are added as new videos are published.

## How to use this repo

1. Clone the repo: `git clone https://github.com/ecogs-sys/learn-matlab.git`
2. Open MATLAB and `cd` into the topic folder for the video you're
   watching (e.g. `topics/while-loop`).
3. Run the `.m` files listed in that folder's README, in the order the
   video walks through them.

## Adding a new topic (for maintainers)

1. Create `topics/<topic-slug>/`.
2. Add the `.m` files for that video, plus a `README.md` inside the folder
   that maps each file to a video timestamp (see `topics/while-loop/README.md`
   for the pattern).
3. Add a row to the **Topics** table above.
