describe 'ColorCMYK', ->

  it 'can convert Hex to CMYK', ->
    cmyk = Color.hex_to_cmyk('#8a796b')
    expect(cmyk.c).toBe 0
    expect(cmyk.m).toBe 12
    expect(cmyk.y).toBe 22
    expect(cmyk.k).toBe 46

  it 'can convert CMYK to Hex', ->
    hex = Color.cmyk_to_hex {c: 0, m: 12, y: 22, k: 46 }
    expect(hex).toBe '#8a796b'

  it 'can retrieve a new CMYK color from Hex string', ->
    result = new Color.from_cmyk('#8a796b').cmyk()
    expect(result.c).toBe 0
    expect(result.m).toBe 12
    expect(result.y).toBe 22
    expect(result.k).toBe 46

  it 'can retrieve a new CMYK color from CMYK values', ->
    color = new Color.from_cmyk {c: 0, m: 12, y: 22, k: 46 }

    hex = color.hex()
    expect(hex).toBe '#8a796b'

    cmyk = color.cmyk()
    expect(cmyk.c).toBe 0
    expect(cmyk.m).toBe 12
    expect(cmyk.y).toBe 22
    expect(cmyk.k).toBe 46

  it 'can say if a CMYK color is valid', ->
    expect(new Color.from_cmyk({c: 50, m: 30, y: 50, k: 50}).is_valid()).toBe true
    expect(new Color.from_cmyk({c: 50, m: 30, y: 50}).is_valid()).toBe false
    expect(new Color.from_cmyk({c: 50, m: 30, k: 50}).is_valid()).toBe false
    expect(new Color.from_cmyk({c: 50, y: 50, k: 50}).is_valid()).toBe false
    expect(new Color.from_cmyk({m: 30, y: 50, k: 50}).is_valid()).toBe false
    expect(new Color.from_cmyk({}).is_valid()).toBe false
