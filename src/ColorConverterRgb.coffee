((CC) ->

  # Accessor

  CC::rgb = () ->
    return CC.hex_to_rgb(@hex())


  # Converters

  CC.rgb_to_hex = (rgb) ->
    r = ('00' + rgb.r.toString(16)).slice(-2)
    g = ('00' + rgb.g.toString(16)).slice(-2)
    b = ('00' + rgb.b.toString(16)).slice(-2)
    return "##{r}#{g}#{b}"

  CC.hex_to_rgb = (hex) ->
    rgb = {}
    rgb.r = ('0x' + (hex.substr(1, 2))) << 0
    rgb.g = ('0x' + (hex.substr(3, 2))) << 0
    rgb.b = ('0x' + (hex.substr(5, 2))) << 0
    return rgb

  # Creation

  CC.from_rgb = (rgb) ->

    is_valid = (rgb) ->
        return if (rgb? && rgb.r? && rgb.g? && rgb.b?) then true else false

    h = if is_valid(rgb) then CC.rgb_to_hex(rgb) else rgb
    return new CC(h)

)(colorconverter)
