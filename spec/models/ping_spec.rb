require 'spec_helper'

# These tests are only for the models and their various
# validations

describe Ping do
  it 'has a valid factory' do
    FactoryGirl.build(:ping).should be_valid
  end

  describe :validations do
    it 'does not require a description' do
      FactoryGirl.build(:ping, :description => nil).should be_valid
    end

    it 'requires a valid wait' do
      # We create a user first, then calculate an invalid user id.
      # The order of these two lines is *important*:
      invalid_id = ( Wait.maximum(:id) || 0 ) + 1

      FactoryGirl.build(:ping, 
        :wait_id => invalid_id
      ).should_not be_valid
    end
  end

  describe :relationships do
    it { should belong_to :wait }
  end

  describe :database_constraints do
    it { should have_foreign_key_for(:waits, :dependent => :delete) }
    it { 
      should have_db_column(:description).
        of_type(:string).
          with_options(null: true)
    }
  end
end
