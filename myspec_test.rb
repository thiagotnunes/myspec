require 'test/unit'
require_relative 'myspec'

class TestMySpec < Test::Unit::TestCase
  def test_it_should_pass
    describe "This is a passing test" do
      it "should pass" do
        2.should == 2
      end
    end
  end

  def test_it_should_fail
    assert_raise AssertionError do
      describe "This is a failing test" do
        it "should fail" do
          3.should == 2
        end
      end
    end
  end

  def test_it_should_pass_be_true
    describe "This is a be true test" do
      it "should pass" do
        true.should be_true
      end
    end
  end

  def test_it_should_fail_be_true
    assert_raise AssertionError do
      describe "This is a be true test" do
        it "should fail" do
          false.should be_true
        end
      end
    end
  end
end
