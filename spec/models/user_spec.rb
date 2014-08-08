require 'spec_helper'

# These tests are only for the models and their various
# validations

describe User do
  it 'has a valid factory' do
    FactoryGirl.build(:user).should be_valid
  end

  describe :validations do
    it 'requires a name' do
      FactoryGirl.build(:user, :name => nil).should_not be_valid
    end
  end
end
