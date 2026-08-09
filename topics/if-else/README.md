# Learn MATLAB: if / elseif / else

Companion code for the YouTube video **"if / elseif / else actually work
like this."** Open these files in MATLAB and run them alongside the video.

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `pass_fail.m` | The simplest form: plain if/else, two mutually-exclusive branches. | 1:50-2:30 |
| `grade_report.m` | Extends it to four outcomes with elseif. MATLAB checks top to bottom and stops at the first true condition. | 2:30-3:30 |
| `grade_report_bug.m` | Same code, conditions reordered loosest-first. `score = 95` silently prints the wrong grade -- no error, just the wrong answer. | 3:30-4:30 |
| `grade_report_stacked_ifs.m` | Same score, but as three independent `if` statements instead of one `elseif` chain -- all three conditions fire, all three print. | 4:30-5:40 |

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `pass_fail.m` first, then try changing `score` to something below 60.
3. Run `grade_report.m` and change `score` to see different grade bands.
4. Run `grade_report_bug.m`. Notice it doesn't error -- it just gives the
   wrong grade for a 95. Compare its condition order to `grade_report.m`.
5. Run `grade_report_stacked_ifs.m` and compare its output to
   `grade_report.m` for the same score.

## Challenge

In `grade_report.m`, add one more branch that prints `Perfect score` when
`score == 100`, without ever letting `Grade: A` print for a 100 instead.

- Where in the chain does that check have to go, and why?
- What happens if you put it after the `score >= 90` check instead?

Work it out by hand, then test it in MATLAB. Post your prediction in the
video comments.
