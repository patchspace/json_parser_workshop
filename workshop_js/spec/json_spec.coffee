require './spec_helper.coffee'

describe "JSON", ->
  parser = null

  beforeEach ->
    parser = newJSONParser()

  parse = (text) -> parser.parse(text)

  describe "Getting started", ->
    specify "nothing", ->
      expect(parse('')).to.deep.equal 'nothing'

  describe "An empty object", ->
    xspecify "simple", ->
      expect(parse('{}')).to.deep.equal { }

    xspecify "with whitespace", ->
      expect(parse('{   }')).to.deep.equal { }

  describe "String values", ->
    xspecify "one character", ->
      expect(parse('{ "a" : "b" }')).to.deep.equal { "a": "b" }

    xspecify "various characters", ->
      expect(parse('{ "AbC_1dE" : "aBc_2De" }')).to.deep.equal { "AbC_1dE": "aBc_2De" }

  describe "Integer values", ->
    xspecify "one digit", ->
      expect(parse('{ "a" : 1 }')).to.deep.equal { "a": 1 }

    xspecify "multiple digits", ->
      expect(parse('{ "a" : 123 }')).to.deep.equal { "a": 123 }

    xspecify "negatives", ->
      expect(parse('{ "a" : -789 }')).to.deep.equal { "a": -789 }

  # Now it gets harder
  describe "Multiple member pairs", ->
    xspecify "three pairs", ->
      expect(
        parse('{ "a" : "b" , "c" : "d" , "e" : "f" }')
      ).to.deep.equal(
        { "a": "b", "c": "d", "e": "f" }
      )

  describe "Objects as values", ->
    xspecify "simplest case", ->
      expect(
        parse('{ "a" : { "x" : "y"} }')
      ).to.deep.equal(
        { "a": { "x": "y" } }
      )

  # Use what you've learnt
  describe "Arrays", ->
    xspecify "empty", ->
      expect(parse('{ "a" : [] }')).to.deep.equal { "a": [ ] }

    xspecify "with an integer", ->
      expect(parse('{ "a" : [1] }')).to.deep.equal { "a": [1] }

    xspecify "with a string", ->
      expect(parse('{ "a" : ["b"] }')).to.deep.equal { "a": ["b"] }

    xspecify "with multiple integers", ->
      expect(parse('{ "a" : [1,2,3] }')).to.deep.equal { "a": [1, 2, 3] }

    xspecify "with whitespace", ->
      expect(parse('{ "a" : [ 1 , 2 , 3] }')).to.deep.equal { "a": [1, 2, 3] }

    xspecify "with objects", ->
      expect(
        parse('{ "a" : [1, { "b" : 2 }, 3] }')
      ).to.deep.equal(
        { "a": [1, { "b": 2 }, 3] }
      )

  # Extra credit
  describe "Something in the JSON spec not covered above", ->
    xspecify "<your example goes here>", ->
      # ...