# Learn MATLAB: variables

Companion code for the YouTube video **"MATLAB variables don't update
themselves."** Open these files in MATLAB and run them alongside the video.

This is the first topic in the series — it assumes no programming
background at all.

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `coffee_order.m` | The main example: one coffee shop order built one variable at a time, then the price goes up. Shows the equals sign as an instruction that runs right to left, what the semicolon and `%` do, the value being wiped, and `total = total + extraShot`. Its header comment also explains `fprintf` and why the `%` in `%.2f` is **not** a comment. | 1:47-4:44 |
| `coffee_order_stale_bug.m` | The break-it-on-purpose version: the price changes after `total` has already been worked out, and nobody works it out again. No error, no warning, 50 cents short. The fix is commented out at the bottom. | 3:22-4:07 |
| `coffee_order_case_error.m` | **Meant to fail.** Asks for `Price` when the box is called `price`. Run it and read the error: `Unrecognized function or variable 'Price'.` | 2:25-2:52 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `coffee_order.m` first (type its name, minus `.m`, at the Command
   Window, or click Run in the Editor).
3. Keep the **Workspace** pane open while you run it — that's MATLAB's
   list of every box you've made and what's in each one right now.
4. Run `coffee_order_stale_bug.m` and compare the printed total against
   what it should be.
5. Run `coffee_order_case_error.m` last. It errors on purpose.

If a line like `fprintf('Total: %.2f\n', total);` looks alarming: `fprintf`
prints one line to the Command Window, and the `%` inside its quote marks is
a slot for a value, not the start of a comment. The header of
`coffee_order.m` spells this out. You can ignore those lines entirely and
still follow every value in the file.

## Challenge

> Back to the original order. `price` 3 dollars 50, `extraShot` 80 cents,
> `total` 4 dollars 30. Now add two lines. `price = 4.00`. Then
> `total = total + extraShot`. What is `total` at the end? Work it out by
> hand, then run it.

```matlab
price     = 3.50;
extraShot = 0.80;
total     = price + extraShot;

price = 4.00;
total = total + extraShot;
```

Work it out by hand before you run it, then post your answer in the video
comments.
