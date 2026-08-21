# Learn MATLAB

Companion code for the "Learn MATLAB" YouTube series. Each video gets its
own folder under `topics/`, with runnable `.m` files and a topic-specific
README that maps files to video timestamps.

## Topics

| Topic | Folder | What it covers |
|---|---|---|
| variables | [`topics/variables`](topics/variables) | Start here. A variable is a box holding one value right now: `=` as an instruction that runs right to left, the Command Window and Workspace, case-sensitive names, and why a total you worked out earlier doesn't update when you change a price. |
| data types | [`topics/data-types`](topics/data-types) | Every box holds one *kind* of value as well as one value: `char`, `logical`, `double`, and `class()` to ask which. Why `'5' + 0.80` is 53.80 instead of 5.80, with no error, and how `str2double` fixes it. |
| while loop | [`topics/while-loop`](topics/while-loop) | How `while` actually evaluates: check, run the whole body, check again. Zero-iteration case and the classic infinite-loop bug. |
| arrays, part 1 (vectors) | [`topics/arrays-1d`](topics/arrays-1d) | 1-based indexing, `end`, colon slicing with `start:step:stop`, building with `1:7`/`zeros`, growing and deleting, whole-vector math, `.*` vs `*`, `sum`/`mean`/`max`, and copy-by-value. |
| arrays, part 2 (matrices) | [`topics/arrays-2d`](topics/arrays-2d) | Rows and columns: building with `;`, `size`, row-then-column indexing (and the silent wrong answer), sub-blocks, adding/deleting rows, transpose, and why `sum(M)` is one total per column. |
| functions | [`topics/functions`](topics/functions) | Writing your own function in its own file: inputs are **copied** in, so changing one inside never touches the caller's variable, and anything created inside is gone when it ends. Capturing the output, losing it to `ans`, and what silently happens when you ask for one output out of two. |
| logical operators | [`topics/logical-operators`](topics/logical-operators) | `&&` and `\|\|` stop the instant the answer is settled, which is the only reason a guard condition guards anything. `&` and `\|` make no such promise, so a safety check written with a single ampersand still crashes on the exact input it was there to catch. Plus `~`, and why order matters. |
| for loop | [`topics/for-loop`](topics/for-loop) | A `for` loop doesn't count — it walks a row of values, so `for price = cart` reads the prices themselves and no index can be written wrong. Plus the catch: the loop variable is a **copy**, not a window, so applying a discount through it runs clean and changes nothing. |

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
