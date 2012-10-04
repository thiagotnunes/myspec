def describe(description, &block)
  ExampleGroup.new(&block)
end

class ExampleGroup
  def initialize(&block)
    instance_eval(&block)
  end

  def it(description, &block)
    block.call
  end

  def be_true
    BooleanAssertion.new(true)
  end
end

class BooleanAssertion
  def initialize(expected)
    @expected = expected
  end

  def assert(subject)
    raise AssertionError unless subject == @expected
  end
end

class Object
  def should(*args)
    if args.empty?
      DelayedAssertion.new(self)
    else
      args[0].assert(self)
    end
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
