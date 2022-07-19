# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from options import terminal, battery_opts, border, groupbox_config, padding


mod = "mod4"
alt = "mod1"
shift = "shift"
ctrl = "control"
# making keybinding easier, you don't need to use strings since these are variables
# if you know python you should know that



keys = [
    
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    # Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    # Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    # Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    # Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, shift], "h", lazy.layout.swap_left(), desc="Move window to the left"),
    Key([mod, shift], "l", lazy.layout.swap_right(), desc="Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, ctrl], "i", lazy.layout.grow(), desc="Grow window to the left"),
    Key([mod, ctrl], "d", lazy.layout.shrink(), desc="Grow window to the right"),
    Key([mod, ctrl], "n", lazy.layout.reset(), desc="Reset all window sizes"),
    Key([mod, ctrl], "o", lazy.layout.maximize(), desc="Reset all window sizes"),
    Key([mod, shift], "space", lazy.layout.flip()),
    # Key([mod, shift, ctrl], "h", lazy.layout.swap_column_left()),
    # Key([mod, shift, ctrl], "l", lazy.layout.swap_column_right()),
    # toggle floating
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle float"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, shift],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, shift], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, shift], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, shift], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # keychord
    KeyChord([mod], "m", [
                 Key([], "w", lazy.spawn("firefox")),
                 Key([], "d", lazy.spawn("discordcanary")),
                 Key([], "e", lazy.spawn(f"{terminal} -e nvim")), 
                 Key([], "v", lazy.spawn("pavucontrol")),
                 Key([], "f", lazy.spawn("thunar")),
                 Key([], "s", lazy.spawn("screenkey"))
             ])
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, shift],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move the focused window to group {}".format(i.name),
            ),
            Key(
                [alt],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            Key([mod], "z", lazy.screen.prev_group(skip_empty=False)),
            Key([mod], "x", lazy.screen.next_group(skip_empty=False)),
            # Key([mod], "[", lazy.screen.prev_group(skip_empty=False)),
            # Key([mod], "]", lazy.screen.next_group(skip_empty=False))
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, shift], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(**border),
    layout.MonadWide(**border),
    # layout.Tile(**border),
    # layout.Columns(border_focus_stack=["4c7bab", "222222"], **border, margin=20),
    # layout.Floating(**border),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
# Mouse callbacks 
def callback_cmd(command): # to use this in a callback, example is at line 168, also the lambda is required
    qtile.cmd_spawn(terminal + " -e " + command)

widget_defaults = [
    ("font", "sans-serif"),
    ("fontsize", 17),
    # ("padding", 3),
    ("foreground", "eeeeee"),
    ("background", "222222")
]

seperator_defaults = dict(
    padding = 10,
    foreground = '888888',
    linewidth = 2
)

powerline_blue = dict(
    text='◂',
    font = 'Ubuntu Mono',
    fontsize=90,
    background='222222',
    foreground='4c7bab',
    padding=0
)
powerline_purple = dict(
    text='◂',
    font='Ubuntu Mono',
    fontsize=50,
    background='222222',
    foreground='4d4cab',
    padding=0
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.Sep(**padding),
                widget.GroupBox(**groupbox_config),
                widget.Sep(**seperator_defaults),
                widget.WindowName(max_chars=40, format="{state}{name}"),
                widget.Spacer(),
                widget.Battery(**battery_opts),
                widget.Sep(**seperator_defaults),
                widget.Wlan(format='📶 {essid} {percent:2.0%}', interface='wlp0s20f3', mouse_callbacks={"Button1": lambda: callback_cmd('nmtui-connect')}),
                widget.Sep(**seperator_defaults),
                widget.CheckUpdates(custom_command="pacman -Qu", no_update_string='📦 ✔️', display_format='📦 {updates}', execute=(f'{terminal} -e sudo pacman -Syu')),
                widget.Sep(**seperator_defaults),
                widget.Memory(format='🧠 {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}', measure_mem="M"),
                widget.Sep(**seperator_defaults),
                widget.Clock(format="🕒 %m/%d/%Y %a %I:%M:%S %p"),
                widget.Sep(**seperator_defaults),
                widget.Systray(),
                widget.Sep(**padding),
            ],
            30,
            # border_width=[5, 0, 3, 0],  # Draw top and bottom borders
            # border_color=["222222", "222222", "222222", "222222"]  # Borders same color as bar bg acting as a padding
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **border,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = 'urgent'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"