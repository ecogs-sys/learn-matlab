# Learn MATLAB: for loops

Companion code for the YouTube video **"MATLAB for Loops Don't Have to
Count."** Open these files in MATLAB and run them alongside the video.

A `for` loop does not count. It walks a **row of values**, one per pass. That
is why `for i = 1:5` works — `1:5` builds a row of numbers, and the loop walks
along it. Hand it a different row and it walks that instead:

```matlab
for price = cart          % price holds 4, then 12, then 3 ...
```

No position is ever worked out, so no position can ever be worked out wrong.
The catch — and it is the whole second half of the video — is that `price`
holds a **copy** of each value, not a window into `cart`. You can read the
cart that way. You cannot write it back.

The running example is a shopping cart of five item prices, in whole dollars:
`cart = [4 12 3 9 2]`. One job, all the way through — **what does this cart
cost, and what happens when the shop knocks a dollar off?**

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `cart_total_indexed.m` | The counting form everyone writes first: `for i = 1:length(cart)`, then `cart(i)`. Correct, and two steps where one would do. | 1:48-2:29 |
| `cart_total_values.m` | The same total with the index deleted: `for price = cart`. Same answer, `cart(...)` never appears. | 2:29-3:08 |
| `cart_total_empty.m` | `cart = []`. Zero values, zero passes, body skipped, no error — with a `passes` counter that proves it. | 3:08-3:32 |
| `cart_discount_bug.m` | Break it on purpose. A dollar off, applied through the loop variable. **Runs clean, prints the right numbers, and changes nothing.** | 3:32-4:00 |
| `cart_discount.m` | The fix. Index form to write back, value form to read — both loops, one file. | 4:00-4:18 |
| `cart_total_while.m` | The same total as a `while` loop. Correct, and three lines of bookkeeping `for` would have done for you. | 4:18-4:53 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `cart_total_indexed.m`. Watch the two steps on the `total` line: `i`
   gives you a position, and `cart(i)` looks up the value at that position.
   Then do its `TRY THIS` — `for i = 1:length(cart) - 1` — and watch it print
   **28 dollars with no error at all**. That is the bug the video opens with:
   the stopping point is yours to write, and getting it wrong by one is a
   wrong answer rather than a crash.
3. Run `cart_total_values.m`. Same 30 dollars, and there is no `cart(i)`
   anywhere in it. Then add a sixth item to `cart` and run it again — nothing
   inside the loop needs to change.
4. Run `cart_total_empty.m`. Zero passes and no error. An empty list is not a
   bug; it is a loop with nothing to do.
5. Run `cart_discount_bug.m`. **Read the printout, then read the last line.**
   The discount was applied and printed. The cart was never discounted:

   ```
   Item now costs 3 dollars.
   ...
   cart is now: 4 12 3 9 2
   ```

   Nothing stopped and nothing crashed. `price` is a copy of the value, not a
   window into `cart`, so subtracting one from it changes a number that MATLAB
   throws away at the top of the next pass.
6. Run `cart_discount.m`. `cart(i)` on the **left** of the `=` is what actually
   changes the cart, because writing means saying *where*.
7. Run `cart_total_while.m` last, and try the three sabotage edits in its
   comments. Every one of them is a mistake `for` makes impossible.

## The habit

**Reading the values? Walk the values.** `for price = cart`.
**Writing them back, or you genuinely need the position number? Use the
index.** `for i = 1:length(cart)`.

And between `for` and `while`: don't know how many passes there will be →
`while`. Got a list in your hand → `for`.

<details>
<summary>Three footnotes, for the curious</summary>

**`for` over something that isn't a row.** MATLAB's `for` walks the
**columns** of whatever you give it. For a row vector like `cart`, one column
*is* one number, which is why you get one value per pass. Give it a column
vector — `cart = [4; 12; 3; 9; 2]` — and you get **one pass**, with the loop
variable holding the whole column. Give it a matrix and you get one pass per
column. That is why everything in this folder is written as a row, and why the
video says "a row of numbers" rather than "an array" every single time.

**Why the Editor underlines `price = price - 1;`.** MATLAB's Code Analyzer
flags assigning to a `for` loop variable inside its own loop, because it
almost always means you have misunderstood what that variable is. It is a
hint, not an error — the file still runs, which is exactly what makes the bug
in `cart_discount_bug.m` dangerous. Take the hint seriously when you see it in
your own code.

**One more, on the name `i`.** MATLAB also uses `i` for the imaginary unit, so
using it as a loop counter quietly shadows that. It will not affect anything
you write this year, but if you ever see `i` behave strangely in maths code,
this is why. Some people use `k` instead for exactly this reason.

</details>

## Challenge

Take the cart. Set `total` to zero. Then:

```matlab
cart  = [4 12 3 9 2];
total = 0;

for price = cart
    total = total + price;
    price = 0;
end
```

You are wiping the loop variable every pass.

**What does `total` come out as, and what is in `cart`?**

Work it out by hand, then check it in MATLAB. Post your answer in the video
comments — the first correct one gets pinned.
