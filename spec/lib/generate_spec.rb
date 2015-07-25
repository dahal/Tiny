require 'rails_helper'

describe Generate do
  context '#possibles' do
    subject { Generate.possibles('Ab12') }
    
    it { expect(subject).to eq(%w(Ab12 4b12 Hb12 Ab1S Ab15 Ab12 Ab1Z Ab1s)) }
  end
end
