describe 'ColorConverter', ->

  it 'can create a color from Hex string using constructor', ->
    result = new ColorConverter('#BADA55').hex()
    expect(result).toBe '#BADA55'

  it 'can create a color from Hex string using acessor method', ->
    result = ColorConverter.from_hex('#BADA55').hex()
    expect(result).toBe '#BADA55'

  it 'can retrieve a random Hex color string', ->
    result = ColorConverter.random().hex()
    expect(typeof(result)).toBe 'string'

  it 'can retrieve a valid random Hex color', ->
    result = ColorConverter.random().hex()
    expect(result).toMatch /^\#([a-fA-F0-9]{6})$/

  it 'can say if a Hex color is valid', ->
    expect(new ColorConverter().is_valid('#ABCDEF')).toBe true
    expect(new ColorConverter().is_valid('#ABCDEX')).toBe false
    expect(new ColorConverter().is_valid('#FFF')).toBe false # I know it is true, but the whole converter class deals with 6 digits colors only
    expect(new ColorConverter().is_valid()).toBe false
    expect(new ColorConverter().is_valid({})).toBe false
    expect(new ColorConverter().is_valid([])).toBe false
