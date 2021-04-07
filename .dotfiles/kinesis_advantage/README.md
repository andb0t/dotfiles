# Configuration of kinesis advantage keyboard

Valuable link: http://xahlee.info/kbd/kinesis_keyboard_howto.html

## Show current status

* open the Advantage2 SmartSet App windows executable while having the keyboard mounted as flash drive
* text info: while cursor in editor press `progm` + `status` to paste layout.

## Manage layouts

* switch between the builtin layouts `progm` + `qwert` or `dvork`
* switch to sub-layout "k_qwerty.txt": `progm` + `k` while on `qwerty` builtin
* create new layout based on builtin: `progm` + `F2`, then any letter to prefix layout, e.g. `a` -> `a_qwerty.txt`
* copy the layout txt files into the mounted flash drives `active` directory

## Activate power user mode

* activation: `progm` + `Shift` + `Escape` -> 4 LED flashes
* deactivation: `progm` + `Shift` + `Escape` -> 2 LED flashes
* open flash drive: in power user mode toggle via `progm` + `F1`

## Print keymap

Use the Advantage2 SmartSet App, make a screenshot and replace the blue with white using

```
convert keymap.png -fuzz 40% -fill white -opaque blue keymap_altered.png
```

