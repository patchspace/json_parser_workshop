require 'spec_helper'
require 'json_parser'

#
# *** Spec generously adapted from:
# *** http://json.org/
#
describe JavaScriptObjectNotationParser do
  let(:parser) { JavaScriptObjectNotationParser.new }

  def conversion_method_for_parse_as
    :to_hash
  end

  describe "Getting started" do
    example do
      pending
      expect('').to parse_as(:nothing)
    end
  end

  describe "An empty object" do
    example do
      pending
      expect('{}').to parse_as({ })
    end

    example do
      pending
      expect('{   }').to parse_as({ })
    end
  end

  describe "String values" do
    example do
      pending
      expect('{ "a" : "b" }').to parse_as({ "a" => "b" })
    end

    example do
      pending
      expect('{ "AbC_1dE" : "aBc_2De" }').to parse_as({ "AbC_1dE" => "aBc_2De" })
    end

    example do
      pending
      expect('{ "a" : "b" }').to parse_as({ "a" => "b" })
    end
  end

  describe "Integer values" do
    example do
      pending
      expect('{ "a" : 1 }').to parse_as({ "a" => 1 })
    end

    example do
      pending
      expect('{ "a" : 123 }').to parse_as({ "a" => 123 })
    end

    example do
      pending
      expect('{ "a" : -789 }').to parse_as({ "a" => -789 })
    end
  end

  # Now it gets harder
  describe "Multiple member pairs" do
    example do
      pending
      expect(
        '{ "a" : "b" , "c" : "d" , "e" : "f" }'
      ).to parse_as(
        { "a" => "b", "c" => "d", "e" => "f" }
      )
    end
  end

  describe "Objects as values" do
    example do
      pending
      expect(
        '{ "a" : { "x" : "y"} }'
      ).to parse_as(
        { "a" => { "x" => "y" } }
      )
    end
  end

  # Serious extra credit!
  describe "Arrays" do
    example do
      pending
      expect('{ "a" : [] }').to parse_as({ "a" => [ ] })
    end

    example do
      pending
      expect('{ "a" : [1] }').to parse_as({ "a" => [1] })
    end

    example do
      pending
      expect('{ "a" : ["b"] }').to parse_as({ "a" => ["b"] })
    end

    example do
      pending
      expect('{ "a" : [1,2,3] }').to parse_as({ "a" => [1, 2, 3] })
    end

    example do
      pending
      expect('{ "a" : [ 1 , 2 , 3] }').to parse_as({ "a" => [1, 2, 3] })
    end

    example do
      pending
      expect(
        '{ "a" : [1, { "b" : 2 }, 3] }'
      ).to parse_as(
        { "a" => [1, { "b" => 2 }, 3] }
      )
    end
  end
end