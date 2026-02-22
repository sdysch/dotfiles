import os
import pdb

print("[INFO] -- Loading custom settings from ~/.pdbrc.py")

# vim keybindings in pager
os.environ["PAGER"] = "less -R"


# === config ===
class Config(pdb.DefaultConfig):
    # colours
    setbgcolor = "dark"
    use_pygments = True
    filename_color = pdb.Color.lightgray
    use_terminal256formatter = True

    # colours
    setbgcolor = "dark"
    use_pygments = True

    # prompt
    prompt = "(Pdb++) → "

    # auto context
    context = 5

    # sticky mode always on
    sticky_by_default = True

    def __init__(self):

        try:
            from pygments.formatters import terminal
        except ImportError:
            pass
        else:
            self.colorscheme = terminal.TERMINAL_COLORS.copy()
            self.colorscheme.update(
                {
                    terminal.Keyword: (139, None),
                    terminal.Number: (186, None),
                    terminal.String: (108, None),
                    terminal.Name.Function: (67, None),
                    terminal.Name.Namespace: (110, None),
                }
            )
