require 'spec_helper'
describe 'autoinstall' do

  context 'with defaults for all parameters' do
    it { should contain_class('autoinstall') }
  end
end
