require 'spec_helper'

describe Statusbot::Models do
  it 'has a version number' do
    expect(Statusbot::Models::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end

  it 'can connect to the database' do
    Statusbot::Models.connect
    debugger
    a=1
  end
end
