global._ = require('underscore')

chai = require('chai')
global.expect = chai.expect

global.PEG = require('pegjs')
fs = require('fs')

# Failed attempt to implement `expect('{}').to.parseAs {}`
# (I don't think Mocha gives Chai etc access to individual example state
# in a similar-enough way to RSpec to do this. I'm not sure though.)
#
# chai.use (_chai, utils) ->
#   Assertion = _chai.Assertion
#
#   Assertion.addMethod 'parseAs', (expected) ->
#     object = utils.flag(this, 'object')
#     new Assertion(parser.parse(object)).to.deep.equal expected

jsonGrammar = fs.readFileSync('./lib/json.pegjs', encoding: 'utf8')
global.newJSONParser = -> PEG.buildParser(jsonGrammar, { cache: true, trackLineAndColumn: true })
