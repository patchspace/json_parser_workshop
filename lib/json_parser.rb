require 'treetop'
Treetop.load(File.dirname(__FILE__) + '/javascript_object_notation.treetop')

class ::Treetop::Runtime::SyntaxNode
  # Convenience method for making Treetop's incidental SyntaxNodes merge
  # You may find this helpful....
  # def to_hash
  #   { }
  # end

  # Convenience method for making Treetop's incidental SyntaxNodes add to arrays
  # You may find this useful if you tackle arrays
  # def value
  #   [ ]
  # end
end

# Again, you might find this useful if you tackle arrays
# (Facets also provides this if you want to use the gem version)
# class Hash
#   alias_method :+, :merge
# end
