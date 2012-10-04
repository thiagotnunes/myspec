def describe(description, &block)
  block.call
end

def it(description, &block)
  block.call
rescue Exception
  raise AssertionError
end

class AssertionError < Exception
end
