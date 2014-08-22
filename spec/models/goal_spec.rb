require 'spec_helper'

# These tests are only for the models and their various
# validations

describe Goal do
  it 'has a valid factory' do
    FactoryGirl.build(:goal).should be_valid
  end

  describe :validations do
    it 'requires a description' do
      FactoryGirl.build(:goal, :description => nil).should_not be_valid
    end

    it 'requires a valid user' do
      # We create a user first, then calculate an invalid user id.
      # The order of these two lines is *important*:
      invalid_id = ( User.maximum(:id) || 0 ) + 1

      FactoryGirl.build(:goal, 
        :user_id => invalid_id
      ).should_not be_valid
    end
  end

  describe :relationships do
    it { should belong_to :user }
  end

  describe :database_constraints do
    it { should have_foreign_key_for(:users, :dependent => :delete) }
    it { 
      should have_db_column(:description).
        of_type(:string).
          with_options(null: false)
    }
  end
end
