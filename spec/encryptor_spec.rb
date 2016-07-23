require 'spec_helper'

describe ActiveCrypto::Encryptor do

  before do
    @opt = {:cipher => 'AES', :block_mode => 'CBC', :keylength => 128}
  end

  let(:encryptor) { ActiveCrypto::Encryptor.new(:test, @opt ) }
  let(:alg) { "AES-256-CBC" }


  it 'with default options' do
    enc = ActiveCrypto::Encryptor.new(:test)
    expect(enc.options).to eq @opt
  end

  it 'can encrypt' do
    encryptor.encrypt("some text", "dummy key", @opt)
  end

  it 'can decrypt' do
    encryptor.decrypt("some text", "dummy key", @opt)
  end
end
