# My hammerspoon config

My personal hotkey configuration, maked by Hammerspoon and Karabiner.

This is a substitute for capslox(becasue capslox is nolonger free).

## Usage

1. use Karabiner bind capslock to F17
2. copy all file to `~/.hammerspoon`

## Hotkey

config already have a set of keys remap, and you can add new key remap in `keys.lua`.

```lua
  {
    -- remap alt + right to capslock + P
    from = { { 'alt' }, 'right' },
    to = 'P',
    -- can hold the key to repeat
    canRepeat = true,
  }
```

the remap hotkeys that I already set:

| hotkey            | function                                                   |
| ----------------- | ---------------------------------------------------------- |
| capslock          | toggle input method between ABC and Chinese                |
| hold capslock     | do nothing                                                 |
| capslock + S      | left                                                       |
| capslock + D      | down                                                       |
| capslock + F      | right                                                      |
| capslock + E      | up                                                         |
| capslock + I      | alt + up                                                   |
| capslock + K      | alt + down                                                 |
| capslock + J      | alt + left                                                 |
| capslock + ;      | cmd + right(move to the end of line)                       |
| capslock + \      | esc                                                        |
| capslock + return | move to a new line                                         |
| capslock + ]      | shift + ctrl + - (goforward in vscode)                     |
| capslock + [      | ctrl + - (goback in vscode)                                |
| capslock + T      | show time                                                  |
| capslock + M      | delete a word before cursor                                |
| capslock + O      | select the word on the left side of the cursor and copy it |

## Auto Switch Imput Method

You can auto switch input method when you focus application or change space, customiza the config in `watcher.lua`. 