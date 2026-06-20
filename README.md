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
- **Layers**: 10 dynamic layers (QWERTY, Number, Symbol, Adjust + 6 empty)
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

**Layers**:

**Layer 0 — QWERTY** (default)

```
┌───────┬─────┬─────┬─────┬─────┬─────┐         ┌─────┬─────┬─────┬─────┬─────┬───────┐
│  ESC  │  Q  │  W  │  E  │  R  │  T  │         │  Y  │  U  │  I  │  O  │  P  │ BSPC  │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│  TAB  │  A  │  S  │  D  │  F  │  G  │         │  H  │  J  │  K  │  L  │  ;  │ ENTER │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│ LSFT  │  Z  │  X  │  C  │  V  │  B  │         │  N  │  M  │  ,  │  .  │  /  │   '   │
└───────┴─────┴─────┴─────┴─────┴─────┘         └─────┴─────┴─────┴─────┴─────┴───────┘
                    ┌─────┬─────┬─────┐         ┌─────┬─────┬─────┐
                    │LCTL │LALT │LGUI │         │ SPC │SYM  │NUM  │
                    └─────┴─────┴─────┘         └─────┴─────┴─────┘
```

**Layer 1 — NUMBER** (right thumb right)

```
┌───────┬─────┬─────┬─────┬─────┬─────┐         ┌─────┬─────┬─────┬─────┬─────┬───────┐
│   `   │  1  │  2  │  3  │  4  │  5  │         │  6  │  7  │  8  │  9  │  0  │ TRANS │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│ TRANS │MCRO0│MCRO1│MCRO2│MCRO3│     │         │     │     │     │     │  ↑  │       │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│ TRANS │     │     │     │     │     │         │     │     │  ←  │  ↓  │  →  │       │
└───────┴─────┴─────┴─────┴─────┴─────┘         └─────┴─────┴─────┴─────┴─────┴───────┘
                    ┌─────┬─────┬─────┐         ┌─────┬─────┬─────┐
                    │     │     │     │         │     │     │     │
                    └─────┴─────┴─────┘         └─────┴─────┴─────┘
```

**Layer 2 — SYMBOL** (right thumb middle)

```
┌───────┬─────┬─────┬─────┬─────┬─────┐         ┌─────┬─────┬─────┬─────┬─────┬───────┐
│   ~   │  !  │  @  │  #  │  $  │  %  │         │  ^  │  &  │  *  │  (  │  )  │ TRANS │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│ TRANS │     │     │     │     │     │         │  -  │  =  │  [  │  ]  │  \  │   `   │
├───────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼───────┤
│ TRANS │     │     │     │     │     │         │  _  │  +  │  {  │  }  │  |  │   ~   │
└───────┴─────┴─────┴─────┴─────┴─────┘         └─────┴─────┴─────┴─────┴─────┴───────┘
                    ┌─────┬─────┬─────┐         ┌─────┬─────┬─────┐
                    │     │ADJ  │     │         │     │     │     │
                    └─────┴─────┴─────┘         └─────┴─────┴─────┘
```

**Layers 3–7 — EMPTY** (Vial customization)

Blank layers available for remapping via Vial.

**Layer 8 — ADJUST** (via Symbol > middle thumb)

```
┌───────┬──────┬──────┬──────┬─────┬─────┐         ┌─────┬─────┬─────┬──────┬──────┬─────┐
│RGB TG │RGB SP│VOL UP│SPI UP│     │     │         │     │     │     │VA +  │VA -  │     │
├───────┼──────┼──────┼──────┼─────┼─────┤         ├─────┼─────┼─────┼──────┼──────┼─────┤
│       │RGB HU│VOL DN│HUI UP│     │     │         │     │     │     │      │      │     │
├───────┼──────┼──────┼──────┼─────┼─────┤         ├─────┼─────┼─────┼──────┼──────┼─────┤
│       │      │      │      │     │     │         │     │     │     │      │      │     │
└───────┴──────┴──────┴──────┴─────┴─────┘         └─────┴─────┴─────┴──────┴──────┴─────┘
                    ┌──────┬──────┬──────┐         ┌─────┬─────┬─────┐
                    │MPREV │MNEXT │MPLAY │         │     │     │     │
                    └──────┴──────┴──────┘         └─────┴─────┴─────┘
```

**Build**:

```bash
nix build .#crkbd-choc-v2
```

The UF2 firmware files are at `result/share/qmk/firmware/{left,right}/`.

**Flash** (RP2040 UF2 bootloader):

```bash
# Left half — waits for bootloader, then flashes:
nix run nixpkgs#qmk -- flash -kb crkbd/rev1 -km choc-v2 -e CONVERT_TO=promicro_rp2040 -bl uf2-split-left

# Right half:
nix run nixpkgs#qmk -- flash -kb crkbd/rev1 -km choc-v2 -e CONVERT_TO=promicro_rp2040 -bl uf2-split-right
```

Or manually: double-tap reset to enter bootloader, then copy the `.uf2` from `result/share/qmk/firmware/{left,right}/` to the mounted USB drive.

### Corne Classic v3 (`crkbd-classic-v3`)

[Corne Keyboard](https://github.com/foostan/crkbd) — same split 3x6 + 3 thumb layout, for **Cherry MX** compatible switches.

- **MCU**: AVR
- **Firmware**: vial-qmk (Vial-compatible QMK fork)
- **Layout**: `LAYOUT_split_3x6_3` — 36 main keys + 3 thumb keys per half
- **Layers**: 6 layers — Base, Number, Symbol, Adjust, Numpad, Alt+Fkeys
- **Features**:
  - Vial combos (4 entries), tap dance (4 entries), key overrides (4 entries)
  - 6 dynamic macros
  - NKRO
  - Split sync (layer/LED/mods)
  - USB auto-detect master/slave

**Tap dances** (base layer): N/RAlt+N, C/RAlt+C, LGUI/LAlt, LShift/CapsLock

**Layer 0 — BASE** (Colemak-ish)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│   ESC   │  Q   │  W   │  E   │  R   │  T   │        │  Y   │  U   │  I   │  O   │  P   │  BSPC   │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│   TAB   │  A   │  S   │  D   │  F   │  G   │        │  H   │  J   │  K   │  L   │  ;   │  ENTER  │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  SFT/   │  Z   │  X   │ C/   │  V   │  B   │        │  '   │  /   │  .   │  ,   │  M   │    N/   │
│ CAPS    │      │      │ RAlt │      │      │        │      │      │      │      │      │   RAlt  │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │ LCTL │GUI/  │ SPC  │        │NUM(1)│SYM(2)│ SPC  │
                        │      │ Alt  │      │        │      │      │      │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Layer 1 — NUMBER** (right thumb right)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│    `    │  1   │  2   │  3   │  4   │  5   │        │  INS │  DEL │ PSCN │  NO  │PAUSE │  trans  │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │MACR0 │MACR1 │MACR2 │MACR3 │MACR4 │        │ PGDN │  ↑   │ PGUP │ HOME │  NO  │         │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │      │      │      │      │      │        │  →   │  ↓   │  ←   │ END  │  NO  │         │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │      │ALT_FK│      │        │      │ADJ(3)│      │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Layer 2 — SYMBOL** (right thumb middle)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│    ~    │  !   │  @   │  #   │  $   │  %   │        │  ^   │  &   │  *   │  (   │  )   │  trans  │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │      │      │      │RAlt5 │      │        │  `   │  |   │  ]   │  [   │  =   │   -     │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │  <   │  >   │      │      │      │        │  ~   │  \   │  {   │  }   │  _   │   +     │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │      │NMPD(4│      │        │      │ADJ(3)│      │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Layer 3 — ADJUST** (via Number/Symbol > right thumb left)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│         │      │VOL UP│      │      │      │        │BOOT  │      │      │      │EE_HND│         │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│         │MPREV │VOL DN│ MNXT │      │      │        │      │      │      │      │      │         │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│         │      │      │      │      │      │        │      │      │      │      │      │         │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │      │MPLAY │      │        │      │      │ MUTE │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Layer 4 — NUMPAD + F-keys** (via Symbol > left thumb)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│  trans  │ F1   │ F2   │ F3   │ F4   │ F5   │        │  NO  │  9   │  8   │  7   │   *  │  trans  │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│    NO   │ F6   │ F7   │ F8   │ F9   │ F10  │        │ ENT  │  =   │  6   │  5   │  4   │    +    │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│    NO   │ F11  │ F12  │      │      │      │        │  /   │  3   │  2   │  1   │  -   │         │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │      │      │      │        │  ,   │  .   │  0   │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Layer 5 — ALT+Fkeys + ALT+numbers** (via Number > left thumb)

```
┌─────────┬──────┬──────┬──────┬──────┬──────┐        ┌──────┬──────┬──────┬──────┬──────┬─────────┐
│  trans  │A-F1  │A-F2  │A-F3  │A-F4  │A-F5  │        │      │RAlt5 │RAlt4 │RAlt3 │RAlt2 │ RAlt1   │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │A-F6  │A-F7  │A-F8  │A-F9  │A-F10 │        │      │RAlt0 │RAlt9 │RAlt8 │RAlt7 │ RAlt6   │
├─────────┼──────┼──────┼──────┼──────┼──────┤        ├──────┼──────┼──────┼──────┼──────┼─────────┤
│  trans  │A-F11 │A-F12 │      │      │      │        │      │      │      │      │      │         │
└─────────┴──────┴──────┴──────┴──────┴──────┘        └──────┴──────┴──────┴──────┴──────┴─────────┘
                        ┌──────┬──────┬──────┐        ┌──────┬──────┬──────┐
                        │      │      │      │        │      │      │      │
                        └──────┴──────┴──────┘        └──────┴──────┴──────┘
```

**Build**:

```bash
nix build .#crkbd-classic-v3
```

The hex firmware files are at `result/share/qmk/firmware/{left,right}/crkbd_rev1_classic-v3.hex`.

**Flash** (Caterina bootloader, avrdude):

```bash
# Left half — waits for bootloader, then flashes:
nix run nixpkgs#qmk -- flash -kb crkbd/rev1 -km classic-v3 -bl avrdude-split-left

# Right half:
nix run nixpkgs#qmk -- flash -kb crkbd/rev1 -km classic-v3 -bl avrdude-split-right
```

Or manually with avrdude: double-tap reset to enter bootloader (7-second window), then:
```bash
nix run nixpkgs#avrdude -- -p atmega32u4 -c avr109 -P usb -U flash:w:result/share/qmk/firmware/left/crkbd_rev1_classic-v3.hex:i
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
