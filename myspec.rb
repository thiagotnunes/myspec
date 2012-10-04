def describe(description, &block)
  block.call
end

def it(description, &block)
  block.call
rescue Exception
  raise AssertionError
end

class Object
  def should
    DelayedAssertion.new(self)
  end
end

class DelayedAssertion
  def initialize(subject)
    @subject = subject
  end

  def ==(other)
    raise AssertionError unless @subject == other
  end

end

class AssertionError < Exception
end
