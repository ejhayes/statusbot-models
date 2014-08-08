require 'spec_helper'

describe Statusbot::Models do
  it 'has a version number' do
    expect(Statusbot::Models::VERSION).not_to be nil
  end

  it 'can connect to the database' do
    Statusbot::Models.connect
  end
end
