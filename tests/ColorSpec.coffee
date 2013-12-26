describe 'Color', ->

  it 'can create a color from Hex string', ->
    result = new Color('#BADA55').hex()
    expect(result).toBe '#BADA55'

  it 'can retrieve a random Hex color string', ->
    result = Color.random().hex()
    expect(typeof(result)).toBe 'string'

  it 'can retrieve a valid random Hex color', ->
    result = Color.random().hex()
    expect(result).toMatch /^\#([a-fA-F0-9]{6})$/

  it 'can say if a Hex color is valid', ->
    expect(new Color().is_valid('#ABCDEF')).toBe true
    expect(new Color().is_valid('#ABCDEX')).toBe false
    expect(new Color().is_valid('#FFF')).toBe false # I know it is true, but the whole class deals with 6 digits colors only
    expect(new Color().is_valid()).toBe false
    expect(new Color().is_valid({})).toBe false
    expect(new Color().is_valid([])).toBe false
