require 'spec_helper'
describe 'eric' do

  context 'with defaults for all parameters' do
    it { should contain_class('eric') }
  end
end
