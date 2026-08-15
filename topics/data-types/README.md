# Learn MATLAB: data types

Companion code for the YouTube video **"MATLAB data types: '5' is not 5."**
Open these files in MATLAB and run them alongside the video.

This is the second topic in the series. It picks up the coffee shop order
from [`topics/variables`](../variables) and asks one new question of it:
what *kind* of thing is in each box?

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `coffee_order_types.m` | The main example: the order from the variables video, with `class()` asked of every box. The three type names — `char`, `logical`, `double` — and the `ans` box MATLAB uses for an answer you didn't name. | 1:03-2:12 |
| `coffee_order_quotes_bug.m` | **Meant to mislead, not to error.** The price goes up to 5 dollars and gets typed as `'5'`, with quote marks. The script runs perfectly and charges 53 dollars 80. Also shows where 53 comes from: `double('5')`. | 2:12-3:24 |
| `str2double_fix.m` | The repair. `str2double` turns text back into a number, `num2str` goes the other way, and the habit that catches this class of bug every time. | 3:24-3:58 |
| `logical_arithmetic.m` | The third type. `true` counts as 1 and `false` as 0, so a member discount is one line — and that is the same conversion rule that ruined the total, being useful for once. | 3:58-4:36 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `coffee_order_types.m` first (type its name, minus `.m`, at the
   Command Window, or click Run in the Editor).
3. Keep the **Workspace** pane open while you run it. Widen the **Class**
   column — that's MATLAB telling you the type of every box without your
   having to ask.
4. Run `coffee_order_quotes_bug.m` and read the total it prints. Nothing
   errors. Nothing warns. The number is simply wrong.
5. Run `str2double_fix.m` and compare.
6. Run `logical_arithmetic.m` last.

If a line like `fprintf('Total: %.2f\n', total);` looks alarming: `fprintf`
prints one line to the Command Window, and the `%` inside its quote marks
is a slot for a value, not the start of a comment. The header of
`coffee_order_types.m` spells this out. You can ignore those lines entirely
and still follow every value in the file.

## A note on longer text

Every piece of text that gets added to a number in these files is exactly
one character long, on purpose. Try `price = '3.50'` and you get one answer
per character — four numbers back instead of one. Same trap, more of it.
Working with several values at once is the arrays video's job.

## Also worth knowing (not in the video)

`class(x)` answers with a name. There is also a family of functions that
answer yes or no — `ischar(x)`, `isnumeric(x)`, `islogical(x)`, `isa(x,
'double')`. They are handy once you are writing checks; `class` alone is
enough to find the bug in this video.

## Challenge

> Start with `extraShot` holding 80 cents. Then `price` equals a 6 in quote
> marks. Then `total` equals `price` plus `extraShot`. What number ends up
> in `total`? Remember, the digit `'0'` is 48. Work it out by hand, then
> run it.

```matlab
extraShot = 0.80;
price     = '6';
total     = price + extraShot;
```

Work it out by hand before you run it, then post your answer in the video
comments.
