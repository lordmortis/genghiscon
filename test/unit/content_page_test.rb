require 'test_helper'

class ContentPageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ContentPage.new.valid?
  end
end
