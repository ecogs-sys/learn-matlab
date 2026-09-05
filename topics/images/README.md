# Learn MATLAB: images

Companion code for the YouTube video **"MATLAB Images Aren't Pictures.
They're Matrices."** Open these files in MATLAB and run them alongside the
video.

A grayscale image is a **matrix of numbers and nothing else**. `0` is black,
`255` is white, everything in between is a shade of grey, and `imshow` does
not make a picture — it colours the numbers in. Which means every matrix tool
you already have *is* the image toolkit:

```matlab
bright   = gray + 40;                    % brightness is addition
neg      = 255 - gray;                   % a negative is a subtraction
cropped  = gray(101:300, 201:400);       % a crop is a block slice
mirrored = gray(:, end:-1:1);            % a mirror is a colon counting backwards
```

The running example is `peppers.png`, MATLAB's sample colour photo, kept for
the whole video and shown next to a live 6x6 block of raw pixel numbers — so
every operation is visible twice, once in the numbers and once in the image.

> **On the numbers you see in the video.** The 6x6 block on screen is a
> *representative rendering*, picked so you can check the arithmetic in your
> head as it happens. It is not a screenshot of this file. Run
> `image_is_a_matrix.m` to see `peppers.png`'s real corner values — and most of
> the scripts here print that corner before and after their operation, so you
> can check the true numbers against the picture yourself.

Builds directly on [`../arrays-2d`](../arrays-2d): rows and columns, `size`,
block slicing, `end`, `M(:)`, transpose and the copy rule are all assumed
here.

---

## Before you start: two things this folder needs

**Run `check_setup.m` first.** It checks both of these and tells you exactly
what to do.

### 1. `imshow` and `rgb2gray` need the Image Processing Toolbox

They are not base MATLAB. `imread`, `imwrite`, `size`, `class` and every
piece of arithmetic and indexing in this folder **are** base MATLAB — the
toolbox is only needed to *display* an image and to collapse colour to grey.

If `check_setup.m` says the toolbox is missing, run this once from inside
this folder:

```matlab
addpath fallback
```

`fallback/` holds two small base-MATLAB stand-ins with the same names, built
out of `image`, `imagesc` and `colormap`:

| Fallback | Built from | Note |
|---|---|---|
| `fallback/imshow.m` | `imagesc(x, [0 255])` + `colormap(gray(256))` + `axis image off`, or `image(x)` for a colour array | Reproduces the `double`-scaling bug in `double_bug.m` on purpose |
| `fallback/rgb2gray.m` | `0.2989*R + 0.5870*G + 0.1140*B` | The same Rec. ITU-R BT.601 luma weights the real one uses |

**Only add that folder if you don't have the toolbox.** If you do have it,
`addpath fallback` shadows the real functions with the stand-ins, which is
not what you want.

Want to do it by hand instead of adding the folder? The one-line base-MATLAB
substitute for `imshow(x)` on a `uint8` grayscale image is:

```matlab
imagesc(x, [0 255]), colormap(gray(256)), axis image off
```

and for a colour `H x W x 3` array it is `image(x), axis image off`.

### 2. `peppers.png`

Every script reads it. If `which('peppers.png')` comes up empty on your
install:

```matlab
addpath fallback
make_test_image          % writes test_pattern.png, 384 x 512 x 3, uint8
```

then change the top line of each script to
`imageFile = 'test_pattern.png';`. Any colour photo of your own works too —
if it is a different size, adjust the crop ranges in `crop_and_mirror.m`.

---

## Files

| File | What it shows | Video timestamp |
|---|---|---|
| `check_setup.m` | Run this first. Toolbox present? `peppers.png` findable? What to do if not. | — |
| `image_is_a_matrix.m` | `imread` gives you an ordinary variable. `size` returns **three** numbers. `rgb2gray` collapses it to 384x512 `uint8`. Then the 6x6 corner, reading one pixel, and writing one. | 0:05–2:16 |
| `brightness_and_negative.m` | `gray + 40`, the `uint8` saturation trap, and `255 - gray`. | 2:16–3:34 |
| `crop_and_mirror.m` | A crop is a block slice. A mirror is `end:-1:1`. Transpose turns it **and** mirrors it. | 3:34–4:52 |
| `measure_and_threshold.m` | `mean(gray(:))` — 196608 numbers in, one out — then logical indexing to make a mask in two lines. | 4:52–5:51 |
| `copy_and_save.m` | `edited = gray` is a real copy; writing straight into `gray` has no undo. Then `imwrite`. | 5:51–6:22 |
| `double_bug.m` | Break it on purpose. `double(gray)` then `imshow` gives a white rectangle, with no error anywhere. And the fix. | 6:22–7:04 |
| `colour_layers.m` | That third number. Three stacked matrices, `img(:,:,1)`, writing a whole layer, and what `rgb2gray` was actually doing. | 7:04–7:55 |

Timestamps are measured from the final edited video's actual audio.

## How to run

1. Open MATLAB and `cd` into this folder.
2. Run `check_setup.m`. Do whatever it tells you (probably nothing).
3. Run the files in the order listed above.
4. In `image_is_a_matrix.m`, watch the two panels the video uses: the picture,
   and `gray(1:6, 1:6)`. **They are the same thing.** Change a number, and the
   dot changes. Most of the later files print that corner before and after
   their operation, so you can check the numbers against the picture as you go.
5. `brightness_and_negative.m` is the one to read slowly. `uint8(230) + 40` is
   `255`, not `270`, and `uint8(10) - 40` is `0`, not `-30` and not `226`. It
   clamps, it does not wrap, and it does not warn you. That is where the
   video's challenge comes from.
6. `double_bug.m` is meant to look broken. **Run it, look at the white
   rectangle, then read `class(d)`.** Nothing errored. Nothing warned. The
   numbers never moved — only the type did, and `imshow` reads the type to
   decide what "white" means.
7. Every file ends with a `TRY THIS` block. Those are where the learning
   actually happens.

## The habit

**A wrong-looking picture with no error message? Ask `class` first.**

That is `data-types` scene 07, applied to an image instead of a number, and
it catches the single most common image bug a first-year hits:

| Type | `imshow` displays it over | So white means |
|---|---|---|
| `uint8` | 0 to 255 | 255 |
| `double` | 0 to 1 | 1 |

`double(img)` without dividing by 255 therefore shows an all-but-white
rectangle, silently. Keep it `uint8`, or divide by 255.

<details>
<summary>Four footnotes, for the curious</summary>

**Why a variable called `gray` is slightly dangerous.** `gray` is also the
name of a built-in MATLAB colormap function — `colormap(gray(256))` is using
it. Naming a variable `gray` shadows that function for as long as the
variable exists, so `colormap(gray(256))` would then try to index your image
with 256 and fail. Nothing in this folder does that, and `fallback/imshow.m`
is a function with its own workspace so it is unaffected. But it is a real
class of bug: **a variable name silently takes precedence over a function of
the same name.** The same reason this folder uses `corner` rather than
`patch` — `patch` is a graphics built-in too.

**`flip`, `fliplr`, `flipud`, `rot90`, `imcrop`, `imrotate`, `imadjust`,
`imbinarize` all exist.** Every operation in the video has a purpose-built
function somewhere. They were deliberately left out, because the whole point
is that you *don't need to know they exist* to do the job — the general tool
already in your hands does it, and the general tool works on anything, not
just images. Go and find them afterwards, by all means. Just don't go looking
for them first.

**`'` versus `.'`.** The apostrophe is the complex-conjugate transpose;
`.'` is the plain one. Image data is real, so the two are identical here and
the video uses `'`. If you ever transpose complex numbers, that difference
matters.

**Why 255 and not 256.** A `uint8` is eight binary digits, so it has 2^8 =
256 distinct values — and because the count starts at 0, the largest one is
255. That is the only reason the white end of the scale is where it is.

</details>

## Challenge

From the video:

> A pixel holds 230. You run
>
> ```matlab
> bright = gray + 40;
> back   = bright - 40;
> ```
>
> **What's in that pixel now?**

Work it out by hand before you touch MATLAB — the whole exercise is the
working out, and it takes about fifteen seconds once you have seen what
`uint8` arithmetic does at the ends of its range. Then check it in the
Command Window.

Post your answer in the video comments — the first correct one gets pinned.
