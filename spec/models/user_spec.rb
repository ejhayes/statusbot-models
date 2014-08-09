require 'spec_helper'

# These tests are only for the models and their various
# validations

describe User do
  it 'has a valid factory' do
    FactoryGirl.build(:user).should be_valid
  end

  describe :validations do
    it 'requires a first name' do
      FactoryGirl.build(:user, :first_name => nil).should_not be_valid
    end

    it 'requires a last name' do
      FactoryGirl.build(:user, :last_name => nil).should_not be_valid
    end

    it 'requires an email' do
      FactoryGirl.build(:user, :email => nil).should_not be_valid
    end
  end

  describe :database_constraints do
    it { should have_db_index(:email).unique(true) }
    it { 
      should have_db_column(:first_name).
        of_type(:string).
          with_options(null: false)
    }
    it { 
      should have_db_column(:last_name).
        of_type(:string).
          with_options(null: false)
    }
    it { 
      should have_db_column(:email).
        of_type(:string).
          with_options(null: false)
    }
  end
end
