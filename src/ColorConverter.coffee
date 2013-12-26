ColorConverter = class

  hex_color: null

  # Instance
  constructor: (hex) ->
    if hex && @is_valid(hex)
      @hex_color = hex

  is_valid: (hex) ->
    color = @hex_color
    if hex?
      color = hex
    return typeof(color) == 'string' && color.match(/^\#([a-fA-F0-9]{6})$/) != null

  hex: () ->
    return @hex_color

  # Static

  @from_hex: (hex) ->
    return new ColorConverter(hex)

  @random: () ->
    rnd = '#'+ ('000000' + (Math.random()*0xFFFFFF<<0).toString(16)).slice(-6)
    return new ColorConverter(rnd)
