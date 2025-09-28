lib:
let
  inherit (lib) types mkOption;

  rgb = types.submodule {
    options = {
      r = mkOption {
        type = types.unsigned;
        description = "Red, 0-255";
      };
      g = mkOption {
        type = types.unsigned;
        description = "Green, 0-255";
      };
      b = mkOption {
        type = types.unsigned;
        description = "Blue, 0-255";
      };
    };
  };

  hsl = types.submodule {
    options = {
      h = mkOption {
        type = types.float;
        description = "Hue, 0-360";
      };
      s = mkOption {
        type = types.float;
        description = "Saturation, 0-100";
      };
      l = mkOption {
        type = types.float;
        description = "Lightness, 0-100";
      };
    };
  };

  colorFormat = types.submodule {
    options = {
      name = mkOption {
        type = types.str;
        description = "Name of the color.";
      };
      order = mkOption {
        type = types.unsigned;
        description = "Order of the color in the palette spec.";
      };
      hex = mkOption {
        type = types.str;
        description = "String-formatted hex value.";
        example = "#babbf1";
      };
      rgb = mkOption {
        type = rgb;
        description = "Formatted rgb value.";
        example = {
          r = 186;
          g = 187;
          b = 241;
        };
      };
      hsl = mkOption {
        type = hsl;
        description = "Formatted hsl value.";
        example = {
          h = 238.9;
          s = 12.1;
          l = 83.5;
        };
      };
      accent = mkOption {
        type = types.bool;
        description = "Indicates whether the color is intended to be used as an accent color.";
      };
    };
  };

  colors = types.submodule {
    options = {
      rosewater = mkOption { type = colorFormat; };
      flamingo = mkOption { type = colorFormat; };
      pink = mkOption { type = colorFormat; };
      mauve = mkOption { type = colorFormat; };
      red = mkOption { type = colorFormat; };
      maroon = mkOption { type = colorFormat; };
      peach = mkOption { type = colorFormat; };
      yellow = mkOption { type = colorFormat; };
      green = mkOption { type = colorFormat; };
      teal = mkOption { type = colorFormat; };
      sky = mkOption { type = colorFormat; };
      sapphire = mkOption { type = colorFormat; };
      blue = mkOption { type = colorFormat; };
      lavender = mkOption { type = colorFormat; };
      text = mkOption { type = colorFormat; };
      subtext1 = mkOption { type = colorFormat; };
      subtext0 = mkOption { type = colorFormat; };
      overlay2 = mkOption { type = colorFormat; };
      overlay1 = mkOption { type = colorFormat; };
      overlay0 = mkOption { type = colorFormat; };
      surface2 = mkOption { type = colorFormat; };
      surface1 = mkOption { type = colorFormat; };
      surface0 = mkOption { type = colorFormat; };
      base = mkOption { type = colorFormat; };
      mantle = mkOption { type = colorFormat; };
      crust = mkOption { type = colorFormat; };
    };
  };

  ansiColorFormat = types.submodule {
    name = mkOption {
      type = types.str;
      description = "Name of the ANSI group.";
    };
    hex = mkOption {
      type = types.str;
      description = "String-formatted hex value.";
      example = "#babbf1";
    };
    rgb = mkOption {
      type = rgb;
      description = "Formatted rgb value.";
      example = {
        r = 186;
        g = 187;
        b = 241;
      };
    };
    hsl = mkOption {
      type = hsl;
      description = "Formatted hsl value.";
      example = {
        h = 238.9;
        s = 12.1;
        l = 83.5;
      };
    };
    code = mkOption {
      type = types.unsigned;
      description = "The ANSI color code.";
      example = 4;
    };
  };

  ansiColorGroup = types.submodule {
    name = mkOption {
      type = types.str;
      description = "Name of the ANSI color.";
    };
    order = mkOption {
      type = types.unsigned;
      description = "Order of the ANSI color in the palette spec.";
    };
    normal = mkOption {
      type = ansiColorFormat;
      description = "An object containing all the ANSI \"normal\" colors, which are the 8 standard colors from 0 to 7.";
    };
    bright = mkOption {
      type = ansiColorFormat;
      description = ''
        An object containing all the ANSI "bright" colors, which are the 8 standard colors from 8 to 15.

        Note: These bright colors are not necessarily "brighter" than the normal colors, but rather more bold and saturated.
      '';
    };
  };

  ansiColors = types.submodule {
    options = {
      black = mkOption { type = ansiColorGroup; };
      red = mkOption { type = ansiColorGroup; };
      green = mkOption { type = ansiColorGroup; };
      yellow = mkOption { type = ansiColorGroup; };
      blue = mkOption { type = ansiColorGroup; };
      magenta = mkOption { type = ansiColorGroup; };
      cyan = mkOption { type = ansiColorGroup; };
      white = mkOption { type = ansiColorGroup; };
    };
  };
in
types.submodule {
  options = {
    name = mkOption {
      type = types.str;
      description = "Name of the flavor.";
    };
    emoji = mkOption {
      type = types.str;
      description = "Emoji associated with the flavor. Requires Unicode 13.0 (2020) or later to render.";
    };
    order = mkOption {
      type = types.unsigned;
      description = "Order of the flavor in the palette spec.";
    };
    dark = mkOption {
      type = types.bool;
      description = "Whether the flavor is a dark theme.";
    };
    colors = mkOption {
      type = colors;
      description = "An object containing all the colors of the flavor.";
    };
    ansiColors = mkOption {
      type = ansiColors;
      description = "An object containing all the ANSI color mappings of the flavor.";
    };
  };
}
