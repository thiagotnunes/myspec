require 'test/unit'
require_relative 'myspec'

class TestMySpec < Test::Unit::TestCase
  def test_it_should_pass
    describe "This is a passing test" do
      it "should pass" do
      end
    end
  end

  def test_it_should_fail
    assert_raise AssertionError do
      describe "This is a failing test" do
        it "should fail" do
          raise IndexError
        end
      end
    end
  end
end
