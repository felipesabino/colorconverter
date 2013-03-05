describe 'ColorBuilder', ->

  it 'can retrieve a RGB color string', ->
    builder = new ColorBuilder()
    result = builder.rgb()
    expect(typeof(result)).toBe "string"

  it 'can retrieve a valid RGB color', ->
    builder = new ColorBuilder()
    result = builder.rgb()
    expect(result).toMatch /^\#([a-fA-F0-9]{6})$/