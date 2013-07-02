require 'test_helper'

class TesterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tester.new.valid?
  end
end
