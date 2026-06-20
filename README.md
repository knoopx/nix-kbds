# Nix KBDs

Reproducible QMK firmware builds for my keyboards using [QMix](https://github.com/Tygo-van-den-Hurk/QMix) and the [vial-qmk](https://github.com/vial-kb/vial-qmk) fork.

[QMix](https://tygo-van-den-hurk.github.io/QMix/) provides two helper functions used here:

- **`fetchQmkFirmware`** — Fetches a pinned version of a QMK firmware repo and primes it so QMK won't warn or crash during build
- **`buildQmkFirmware`** — Builds firmware for a specific keyboard, injecting custom keymap source via `src` / `srcMount`

This project fetches **vial-qmk** (QMK fork with [Vial](https://getvial.io/) support) at a specific commit, then builds each keymap by injecting local source into the firmware tree.

---

## Keyboards

### Corne Chocolate v2 (`crkbd-choc-v2`)

[Corne Keyboard](https://github.com/foostan/crkbd) — split 3x6 + 3 thumb layout based on [Helix](https://github.com/MakotoKurauchi/helix), for **Kailh Choc v1/v2** switches.

- **MCU**: RP2040 ProMicro (`CONVERT_TO=promicro_rp2040`)
- **Firmware**: vial-qmk (Vial-compatible QMK fork)
- **Layout**: `LAYOUT_split_3x6_3` — 36 main keys + 3 thumb keys per half
- **Features**:
  - RGB Matrix with typing heatmap, alphas mods, band pinwheel/spiral, gradient effects
  - RGB layer/color indicators per active layer
  - Caps Lock indicator (rainbow or accent color)
  - Idle dimming (fades after 60s, full off after 30min)
  - Vial combos (10 entries), key overrides (10 entries), tap dance (10 entries)
  - 10 dynamic macros
  - Leader sequences, combos, key overrides, tap dance
  - Unicode input (common + full)
  - Auto-shift, retro shift, space cadet (sticky shift/ctrl on double-tap)
  - NKRO
  - Split sync: layer state, LED state, mods, transaction mirror
  - USB auto-detect master/slave

Layer diagrams: see [Corne Keymap Layouts](#corne-keymap-layouts) below.

**Build**:

```bash
nix build .#crkbd-choc-v2
```

The UF2 firmware files are at `result/share/qmk/firmware/{left,right}/`.

**Flash** (RP2040 UF2 bootloader):

```bash
# Flash left half — double-tap reset when prompted:
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/left/*.uf2 -bl uf2-split-left

# Flash right half — double-tap reset when prompted:
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/right/*.uf2 -bl uf2-split-right
```

### Corne Classic v3 (`crkbd-classic-v3`)

[Corne Keyboard](https://github.com/foostan/crkbd) — same split 3x6 + 3 thumb layout, for **Cherry MX** compatible switches.

- **MCU**: AVR
- **Firmware**: vial-qmk (Vial-compatible QMK fork)
- **Layout**: `LAYOUT_split_3x6_3` — 36 main keys + 3 thumb keys per half
- **Features**:
  - Vial combos (4 entries), tap dance (4 entries), key overrides (4 entries)
  - 6 dynamic macros
  - NKRO
  - Split sync (layer/LED/mods)
  - USB auto-detect master/slave

Layer diagrams: see [Corne Keymap Layouts](#corne-keymap-layouts) below.

**Build**:

```bash
nix build .#crkbd-classic-v3
```

The hex firmware files are at `result/share/qmk/firmware/{left,right}/crkbd_rev1_classic-v3.hex`.

**Flash** (Caterina bootloader, avrdude):

```bash
# Flash left half — double-tap reset when prompted:
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/left/crkbd_rev1_classic-v3.hex -bl avrdude-split-left

# Flash right half — double-tap reset when prompted:
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/right/crkbd_rev1_classic-v3.hex -bl avrdude-split-right
```

---

## Corne Keymap Layouts

**QWERTY Layer**

```
              ┌──┐                              ┌──┐
          ┌──┐│E │┌──┐┌──┐              ┌──┐┌──┐│I │┌──┐
  ┌──┐┌──┐│W ││  ││R ││T │              │Y ││U ││  ││O │┌──┐┌──┐
  │⎋ ││Q ││  │└──┘│  ││  │              │  ││  │└──┘│  ││P ││⌫ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│D │┌──┐┌──┐              ┌──┐┌──┐│K │┌──┐└──┘└──┘
  ┌──┐┌──┐│S ││  ││F ││G │              │H ││J ││  ││L │┌──┐┌──┐
  │⇥ ││A ││  │└──┘│  ││  │              │  ││  │└──┘│  ││; ││⏎ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│TD│┌──┐┌──┐              ┌──┐┌──┐│, │┌──┐└──┘└──┘
  ┌──┐┌──┐│X ││6 ││V ││B │              │TD││M ││  ││. │┌──┐┌──┐
  │TD││Z ││  │└──┘│  ││  │              │5 ││  │└──┘│  ││/ ││' │
  │8 ││  │└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││  │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │L⌃│ │TD│  │␣ │    │␣ │  │MO│ │MO│
                │  │ │7 │  │  │    │  │  │2 │ │1 │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
```

**Navigation Layer**

```
              ┌──┐                              ┌──┐
          ┌──┐│3 │┌──┐┌──┐              ┌──┐┌──┐│*1│┌──┐
  ┌──┐┌──┐│2 ││  ││4 ││5 │              │⏸ ││  ││  ││⌦ │┌──┐┌──┐
  │~ ││1 ││  │└──┘│  ││  │              │  ││  │└──┘│  ││INS│▽ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│M │┌──┐┌──┐              ┌──┐┌──┐│⇱ │┌──┐└──┘└──┘
  ┌──┐┌──┐│M ││2 ││M ││M │              │  ││  ││  ││⇞ │┌──┐┌──┐
  │▽ ││M ││1 │└──┘│3 ││4 │              │  ││  │└──┘│  ││↑ ││⇟ │
  │  ││0 │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│▽ │┌──┐┌──┐              ┌──┐┌──┐│⇲ │┌──┐└──┘└──┘
  ┌──┐┌──┐│▽ ││  ││▽ ││  │              │  ││  ││  ││← │┌──┐┌──┐
  │▽ ││▽ ││  │└──┘│  ││  │              │  ││  │└──┘│  ││↓ ││→ │
  │  ││  │└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││  │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │▽ │ │MO│  │▽ │    │▽ │  │MO│ │  │
                │  │ │4 │  │  │    │  │  │5 │ │  │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
*1 - KC_PRINT_SCREEN
```

**Symbol Layer**

```
              ┌──┐                              ┌──┐
          ┌──┐│L⇧│┌──┐┌──┐              ┌──┐┌──┐│L⇧│┌──┐
  ┌──┐┌──┐│L⇧││3 ││L⇧││L⇧│              │L⇧││L⇧││8 ││L⇧│┌──┐┌──┐
  │L⇧││L⇧││2 │└──┘│4 ││5 │              │6 ││7 │└──┘│9 ││L⇧││▽ │
  │~ ││1 │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│0 ││  │
  └──┘└──┘┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│( │┌──┐└──┘└──┘
  ┌──┐┌──┐│  ││  ││*1││  │              │- ││= ││  ││) │┌──┐┌──┐
  │▽ ││  ││  │└──┘│  ││  │              │  ││  │└──┘│  ││L⇧││~ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│\ ││  │
  └──┘└──┘┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│L⇧│┌──┐└──┘└──┘
  ┌──┐┌──┐│L⇧││  ││  ││  │              │L⇧││L⇧││( ││L⇧│┌──┐┌──┐
  │▽ ││*2││. │└──┘│  ││  │              │- ││= │└──┘│) ││\ ││L⇧│
  │  ││  │└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││~ │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │▽ │ │MO│  │▽ │    │▽ │  │  │ │MO│
                │  │ │3 │  │  │    │  │  │  │ │5 │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
*1 - RALT(KC_5)
*2 - L⇧,,
```

**F-keys / Number Layer**

```
              ┌──┐                              ┌──┐
          ┌──┐│F3│┌──┐┌──┐              ┌──┐┌──┐│8 │┌──┐
  ┌──┐┌──┐│F2││  ││F4││F5│              │K*││7 ││  ││9 │┌──┐┌──┐
  │▽ ││F1││  │└──┘│  ││  │              │  ││  │└──┘│  ││  ││▽ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│F8│┌──┐┌──┐              ┌──┐┌──┐│5 │┌──┐└──┘└──┘
  ┌──┐┌──┐│F7││  ││F9││F │              │K+││4 ││  ││6 │┌──┐┌──┐
  │  ││F6││  │└──┘│  ││10│              │  ││  │└──┘│  ││K=││K⏎│
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│2 │┌──┐└──┘└──┘
  ┌──┐┌──┐│F ││  ││  ││  │              │K-││1 ││  ││3 │┌──┐┌──┐
  │  ││F ││12│└──┘│  ││  │              │  ││  │└──┘│  ││/ ││  │
  │  ││11│└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││  │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │  │ │  │  │  │    │0 │  │. │ │, │
                │  │ │  │  │  │    │  │  │  │ │  │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
```

**Alt-F / Alt-Number Layer**

```
              ┌──┐                              ┌──┐
          ┌──┐│*1│┌──┐┌──┐              ┌──┐┌──┐│*2│┌──┐
  ┌──┐┌──┐│*3││  ││*4││*7│              │*8││*5││  ││*6│┌──┐┌──┐
  │▽ ││*9││  │└──┘│  ││  │              │  ││  │└──┘│  ││*10│▽ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│*11┌──┐┌──┐              ┌──┐┌──┐│*12┌──┐└──┘└──┘
  ┌──┐┌──┐│*13│  ││*14│*17              │*18│*15│  ││*16┌──┐┌──┐
  │▽ ││*19│  │└──┘│  ││  │              │  ││  │└──┘│  ││*20│▽ │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│  │┌──┐└──┘└──┘
  ┌──┐┌──┐│*21│  ││  ││  │              │  ││  ││  ││  │┌──┐┌──┐
  │▽ ││*22│  │└──┘│  ││  │              │  ││  │└──┘│  ││  ││  │
  │  ││  │└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││  │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │▽ │ │▽ │  │▽ │    │▽ │  │  │ │  │
                │  │ │  │  │  │    │  │  │  │ │  │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
*1 - LALT(KC_F3)
*2 - RALT(KC_3)
*3 - LALT(KC_F2)
*4 - LALT(KC_F4)
*5 - RALT(KC_2)
*6 - RALT(KC_4)
*7 - LALT(KC_F5)
*8 - RALT(KC_1)
*9 - LALT(KC_F1)
*10 - RALT(KC_5)
*11 - LALT(KC_F8)
*12 - RALT(KC_8)
*13 - LALT(KC_F7)
*14 - LALT(KC_F9)
*15 - RALT(KC_7)
*16 - RALT(KC_9)
*17 - LALT(KC_F10)
*18 - RALT(KC_6)
*19 - LALT(KC_F6)
*20 - RALT(KC_0)
*21 - LALT(KC_F12)
*22 - LALT(KC_F11)
```

**Layer 5 — Media / System**

```
              ┌──┐                              ┌──┐
          ┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│  │┌──┐
  ┌──┐┌──┐│V+││  ││  ││  │              │*2││*1││  ││  │┌──┐┌──┐
  │  ││  ││  │└──┘│  ││  │              │  ││  │└──┘│  ││  ││*3│
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│>>│┌──┐┌──┐              ┌──┐┌──┐│  │┌──┐└──┘└──┘
  ┌──┐┌──┐│V-││  ││  ││  │              │  ││  ││  ││  │┌──┐┌──┐
  │  ││<<││  │└──┘│  ││  │              │  ││  │└──┘│  ││  ││  │
  │  ││  │└──┘┌──┐└──┘└──┘              └──┘└──┘┌──┐└──┘│  ││  │
  └──┘└──┘┌──┐│  │┌──┐┌──┐              ┌──┐┌──┐│  │┌──┐└──┘└──┘
  ┌──┐┌──┐│  ││  ││  ││  │              │  ││  ││  ││  │┌──┐┌──┐
  │  ││  ││  │└──┘│  ││  │              │  ││  │└──┘│  ││  ││  │
  │  ││  │└──┘    └──┘└──┘              └──┘└──┘    └──┘│  ││  │
  └──┘└──┘      ┌──┐ ┌──┐  ┌──┐    ┌──┐  ┌──┐ ┌──┐      └──┘└──┘
                │  │ │  │  │⏯ │    │Mut  │  │ │  │
                │  │ │  │  │  │    │  │  │  │ │  │
                └──┘ └──┘  │  │    │  │  └──┘ └──┘
                           │  │    │  │
                           └──┘    └──┘
*1 - QK_MAGIC_EE_HANDS_RIGHT
*2 - QK_MAGIC_EE_HANDS_LEFT
*3 - QK_BOOTLOADER
```
---

## Requirements

- [Nix](https://nixos.org/download.html) with flakes enabled

## Usage

### Build firmware

```bash
# Corne Chocolate v2 (RP2040, UF2)
nix build .#crkbd-choc-v2

# Corne Classic v3 (AVR, hex)
nix build .#crkbd-classic-v3
```

The compiled firmware is in `result/share/qmk/firmware/{left,right}/`.

### Flash firmware

The `-bl avrdude-split-left` / `-bl uf2-split-left` bootloaders wait interactively for you to double-tap reset, then flash and set EEPROM handedness.

**Corne Classic v3 (AVR):**

```bash
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/left/crkbd_rev1_classic-v3.hex -bl avrdude-split-left
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/right/crkbd_rev1_classic-v3.hex -bl avrdude-split-right
```

**Corne Chocolate v2 (RP2040):**

```bash
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/left/*.uf2 -bl uf2-split-left
nix run nixpkgs#qmk -- flash result/share/qmk/firmware/right/*.uf2 -bl uf2-split-right
```

### Display layout

Render the keyboard layout from a connected keyboard:

```bash
nix run path:.#vitaly -- layers
```

### Development shell

```bash
nix develop
```

Enters a shell with `qmk` CLI and `git` available.

### Format

```bash
nix fmt
```

## Project structure

```
flake.nix                          # Flake definition, QMix input, packages
keyboards/
  crkbd/
    keymaps/
      choc-v2/                      # Corne Chocolate v2 keymap
        config.h                    # Vial UID, layer/macro counts, RGB settings
        keymap.c                    # Layer definitions and key bindings
        rules.mk                    # Feature toggles (RGB Matrix, Vial, Unicode, etc.)
        vial.json                   # Vial layout definition (matrix, key positions)
      classic-v3/                   # Corne Classic v3 keymap
        config.h                    # Vial UID, layer/macro counts
        keymap.c                    # Layer definitions and key bindings
        rules.mk                    # Feature toggles (Vial, tap dance, etc.)
        vial.json                   # Vial layout definition
```

## How it works

1. **`fetchQmkFirmware`** fetches vial-qmk at a pinned commit and primes the repo
2. **`buildQmkFirmware`** injects local keymap source (`src`) into the firmware tree at the mount path (`srcMount`), then runs the QMK build
3. Each keymap is a separate package, built independently

See the [QMix docs](https://tygo-van-den-hurk.github.io/QMix/) for full details on `fetchQmkFirmware` and `buildQmkFirmware`.

## Updating vial-qmk

To update the vial-qmk source, change `rev` and `hash` in `flake.nix`:

```nix
vialQmkFirmware = pkgs.fetchQmkFirmware {
  url = "https://github.com/vial-kb/vial-qmk.git";
  origin = "https://github.com/vial-kb/vial-qmk.git";
  rev = "...";          # new commit hash
  hash = "sha256-...";  # compute with `nix-prefetch-git` or let nix suggest it
};
```

## Adding a new keymap

1. Create a directory under `keyboards/crkbd/keymaps/<name>/`
2. Add `keymap.c`, `config.h`, `rules.mk`, and `vial.json`
3. Add a package entry in `flake.nix`:

```nix
my-keymap = pkgs.buildQmkFirmware {
  keyboard = "crkbd";
  keymap = "my-keymap";
  split = true;
  src = ./keyboards/crkbd/keymaps/my-keymap;
  srcMount = "keyboards/crkbd/keymaps/my-keymap";
  qmkFirmware = vialQmkFirmware;
};
```

## Stack

- **[Nix](https://nixos.org/)** — Reproducible builds
- **[QMix](https://github.com/Tygo-van-den-Hurk/QMix)** — `fetchQmkFirmware` / `buildQmkFirmware`
- **[vial-qmk](https://github.com/vial-kb/vial-qmk)** — QMK fork with Vial support
- **[Vial](https://getvial.io/)** — Cross-platform keymap editor
