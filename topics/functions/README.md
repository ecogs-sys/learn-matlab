# Learn MATLAB: functions

Companion code for the YouTube video **"MATLAB Functions Can't Touch Your
Variables."** Open these files in MATLAB and run them alongside the video.

A function does not share your workspace. It gets its own copy of whatever
you pass in, and everything it creates inside disappears when it ends. The
only things that come out are the outputs you named — and only if you catch
them.

## Files

There are two kinds of file in this folder.

**Function files** — `vend.m`, `vend_takes_coins.m`, `vend_two_outputs.m`.
You don't Run these. MATLAB calls them for you. Press Run on one and you get
`Not enough input arguments`, because nothing supplied its input.

**Scripts** — everything starting `buy_snack`. These are the ones you Run.

| File | What it shows | Video timestamp |
|---|---|---|
| `vend.m` | The function itself: `function change = vend(coins)`, a body, `end`. Lives in a file of its own, named after the function, because MATLAB finds it by the **file** name. | 1:19 |
| `buy_snack.m` | The running example. Calls `vend`, catches what comes back. Trace it by hand first, then run it. | 2:01 |
| `vend_takes_coins.m` | The break-it-on-purpose function: one extra line, `coins = 0`, after the change is worked out. | 3:31 |
| `buy_snack_wallet_bug.m` | Calls it and checks the wallet. Change is correct, wallet is **still 2.00**, and there is no error and no warning anywhere. | 3:31 |
| `buy_snack_inside_gone.m` | The other direction: `price` was created inside `vend`, so printing it afterwards fails with `Unrecognized function or variable 'price'`. **Errors on purpose.** | 4:17 |
| `buy_snack_no_capture.m` | Calling with nothing on the left of an equals sign. The answer lands in `ans`, the next call overwrites it, and a semicolon hides it completely. | 4:56 |
| `vend_two_outputs.m` | The same `vend`, handing back two things: `function [snack, change] = ...`. | 5:25 |
| `buy_snack_two_outputs.m` | Catching both with `[snack, change] = ...`, then asking for only one — which silently gives you the **first** output, so `change` ends up holding the word `Chips`. | 5:25 |

## How to run

1. Open MATLAB and `cd` into this folder. All the files have to be in the
   same folder, or MATLAB won't find the function files when the scripts
   call them.
2. Run `buy_snack.m` first (type its name, minus `.m`, at the Command
   Window, or click Run in the Editor). Open `vend.m` beside it and read
   the two together.
3. Run `buy_snack_wallet_bug.m`. Notice it doesn't error and doesn't warn —
   it just leaves your wallet exactly where it was.
4. Run `buy_snack_inside_gone.m`. This one **stops with an error**, and that
   error is the friendly version of the same rule.
5. Run `buy_snack_no_capture.m` and watch `ans` get overwritten.
6. Run `buy_snack_two_outputs.m` last. Its second-to-last display is a
   variable called `change` holding the word `Chips` — compare that with
   what you expected.

Two things worth trying yourself:

- In `buy_snack.m`, rename `change` on the left of the call to `myChange`.
  Nothing in `vend.m` has to change. The names never meet.
- Rename `vend.m` to `machine.m` without touching the `function` line
  inside it. MATLAB now answers to `machine(...)`, and the Editor flags the
  mismatch — MATLAB goes by the **file** name. Rename it back.

## Challenge

Take the two-output `vend` (`vend_two_outputs.m`). The snack costs 1.50, and
your wallet holds 1.00 — not enough. You call it like this, with one name on
the left:

```matlab
wallet = 1.00;
change = vend_two_outputs(wallet);
```

Two questions:

- What is in `change` after that line?
- What is in `wallet` after that line?

Work them out by hand first, then run it in MATLAB and check. Post your
answer in the video comments — the first correct one gets pinned.
