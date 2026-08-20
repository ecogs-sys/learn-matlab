# Learn MATLAB: logical operators

Companion code for the YouTube video **"MATLAB's & Won't Guard You -- &&
Will."** Open these files in MATLAB and run them alongside the video.

`&&` and `||` read left to right and stop the instant the answer is settled.
That is the only reason a guard condition guards anything: the left half gets
to protect the right half. `&` and `|` make you no such promise — they are
built to work across whole arrays, one answer per element — so a safety check
written with a single ampersand can still crash on exactly the input it was
there to catch.

The running example is a five-bay parking garage as a row vector,
`spots = [1 0 1 0 0]`: `1` means the bay is occupied, `0` means it is empty.
One question, all the way through — **is the spot they asked for both real and
taken?**

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `parking_check.m` | The running example. `request <= length(spots) && spots(request) == 1`. Set `request` to 7 and watch `&&` refuse to look past the end of the vector — no error, no crash. | 1:50-3:04 |
| `parking_check_guarded.m` | A floor as well as a ceiling. `\|\|` for "below the bottom **or** above the top", `~` to flip it, `&&` to keep `spots(0)` from ever running. This is the finished version. | 3:04-3:45 |
| `parking_check_amp_bug.m` | The same file with **one character deleted** — the second ampersand. `request` is 7, the line above has already proved there is no spot 7, and it looks anyway. **Errors on purpose.** | 3:45-4:27 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `parking_check.m` first. Then change `request` to `7` and run it
   again. It does not error — and it prints `Spot 7 is free.`, which is
   nonsense, because there is no spot 7. That is what the next file fixes.
3. Run `parking_check_guarded.m`. Try `request` at `0`, `7`, `3` and `2` and
   check each answer against what you expected.
4. Run `parking_check_amp_bug.m`. This one **stops with an error**:

   ```
   Index exceeds the number of array elements. Index must not exceed 5.
   ```

   Read the two lines above the crash before you fix it. `badRequest` is
   already `true`. `~badRequest` is already `false`. The answer was settled,
   and the single `&` went and looked in spot 7 anyway.

Two things worth trying yourself:

- In `parking_check_amp_bug.m`, change the `||` on the `badRequest` line to a
  single `|` as well. Same crash, same place, and the `|` itself causes no
  trouble at all — both halves of *that* line are safe to work out. The single
  operators cost you nothing right up until the moment they cost you
  everything.
- In `parking_check_guarded.m`, set `request` to `2` and change the `&&` on the
  `taken` line to `&`. It does not crash, and it prints the right answer. A
  bug that only appears on bad input is a bug that ships.

## The habit

**Two single values, one yes-or-no question? Use the doubles, `&&` and `||`,
every time.** MATLAB's own Code Analyzer will nag you about this in the Editor,
and it is right.

<details>
<summary>One footnote, for the curious</summary>

There is a corner where MATLAB *does* short-circuit `&` and `|`: when one of
them is the **top-level operator in the condition of an `if` or `while`
statement**. So `if ~badRequest & spots(request) == 1` may well not crash,
while the identical test written as `taken = ~badRequest & spots(request) == 1;`
definitely does — which is why every file here works the answer out on its own
line first.

This is not a licence to use `&` in an `if`. It means the difference between
`&` and `&&` is invisible in one place and fatal in another, which is a much
worse thing to have in your code than a rule you always follow. Use the
doubles.
</details>

## Challenge

Take `parking_check_guarded.m`, set `request` to `7` (it ships at `0`), and
swap the two halves of the `taken` line:

```matlab
taken = ~badRequest && spots(request) == 1;      % as it ships
taken = spots(request) == 1 && ~badRequest;      % swap the two halves
```

Same operator. Opposite order.

Does it still print `There is no spot 7.`, or does it crash?

Work it out by hand first, then run it in MATLAB and check. Post your answer in
the video comments — the first correct one gets pinned.
