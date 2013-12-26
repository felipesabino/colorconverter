((C) ->

  # Converters

  C.cmyk_to_hex = (cmyk) ->

    c = cmyk.c / 100
    m = cmyk.m / 100
    y = cmyk.y / 100
    k = cmyk.k / 100

    c = 0 if (c <= 0)
    m = 0 if (m <= 0)
    y = 0 if (y <= 0)
    k = 0 if (k <= 0)

    c = 1 if (c > 1)
    m = 1 if (m > 1)
    y = 1 if (y > 1)
    k = 1 if (k > 1)

    rgb = {}
    rgb.r = 1 - Math.min(1, c * (1 - k) + k)
    rgb.g = 1 - Math.min(1, m * (1 - k) + k)
    rgb.b = 1 - Math.min(1, y * (1 - k) + k)
    rgb.r = Math.round(rgb.r * 255)
    rgb.g = Math.round(rgb.g * 255)
    rgb.b = Math.round(rgb.b * 255)
    return C.rgb_to_hex(rgb)

  C.hex_to_cmyk = (hex) ->

    rgb = C.hex_to_rgb(hex)

    cmyk = {}
    r = rgb.r / 255
    g = rgb.g / 255
    b = rgb.b / 255
    cmyk.k = Math.min(1 - r, 1 - g, 1 - b)
    cmyk.c = (1 - r - cmyk.k) / (1 - cmyk.k)
    cmyk.m = (1 - g - cmyk.k) / (1 - cmyk.k)
    cmyk.y = (1 - b - cmyk.k) / (1 - cmyk.k)
    cmyk.c = Math.round(cmyk.c * 100)
    cmyk.m = Math.round(cmyk.m * 100)
    cmyk.y = Math.round(cmyk.y * 100)
    cmyk.k = Math.round(cmyk.k * 100)
    return cmyk

  # Creation

  C.from_cmyk = (cmyk) ->

    is_valid = (cmyk) ->
        return if (cmyk? && cmyk.c? && cmyk.m? && cmyk.y? && cmyk.k?) then true else false

    h = if is_valid(cmyk) then C.cmyk_to_hex(cmyk) else cmyk
    return new C(h)

  # Accessor

  C::cmyk = () ->
    return C.hex_to_cmyk(@hex())

)(Color)
