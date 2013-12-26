describe 'ColorConverterRGB', ->

  it 'can convert Hex to RGB', ->
    rgb = ColorConverter.hex_to_rgb('#0a141e')
    expect(rgb.r).toBe 10
    expect(rgb.g).toBe 20
    expect(rgb.b).toBe 30

  it 'can convert RGB to Hex', ->
    hex = ColorConverter.rgb_to_hex {r: 10, g: 20, b:30 }
    expect(hex).toBe '#0a141e'

  it 'can retrieve a new RGB color from Hex string', ->
    result = ColorConverter.from_rgb('#0a141e').rgb()
    expect(result.r).toBe 10
    expect(result.g).toBe 20
    expect(result.b).toBe 30

  it 'can retrieve a new RGB color from RGB values', ->
    color = ColorConverter.from_rgb {r: 10, g: 20, b:30 }

    hex = color.hex()
    expect(hex).toBe '#0a141e'

    rgb = color.rgb()
    expect(rgb.r).toBe 10
    expect(rgb.g).toBe 20
    expect(rgb.b).toBe 30

  it 'can say if a RGB color is valid', ->
    expect(ColorConverter.from_rgb({r: 50, g: 30, b: 50}).is_valid()).toBe true
    expect(ColorConverter.from_rgb({r: 50, g: 30}).is_valid()).toBe false
    expect(ColorConverter.from_rgb({r: 50, b: 50}).is_valid()).toBe false
    expect(ColorConverter.from_rgb({g: 30, b: 50}).is_valid()).toBe false
    expect(ColorConverter.from_rgb({}).is_valid()).toBe false
