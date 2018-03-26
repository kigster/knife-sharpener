require 'spec_helper'

module Knife
  module Sharpener
    RSpec.describe Hosts do
      let(:sprintf_template) { 'demo%3.3d-staging' }
      subject(:host) { described_class.new(
          number_spec:      numbers,
          sprintf_template: sprintf_template)
      }

      describe 'when numbers are passed in as a ' do
        describe 'range' do
          let(:numbers) { '1..5' }
          its(:index) { should eq 1 }
          its(:size) { should eq 4 }
        end
      end
    end
  end
end
