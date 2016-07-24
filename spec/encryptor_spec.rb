require 'spec_helper'

describe ActiveCrypto::Encryptor do

  before do
    @key = "k" * 32
    @iv = "\0" * 32
    @opt = {:cipher => 'AES', :block_mode => 'CBC', :keylength => 256}
  end

  let(:encryptor) { ActiveCrypto::Encryptor.new(:test, @opt ) }
  let(:alg) { "AES-256-CBC" }
  let(:text) { "some text" }


  it 'with default algorithm options' do
    enc = ActiveCrypto::Encryptor.new(:test)
    expect(enc.options).to eq @opt
  end

  it 'can encrypt' do
    enc = encryptor.encrypt(text, @key, @opt)
    expect(enc).to_not eq text
  end

  it 'can decrypt' do
    enc = encryptor.encrypt(text, @key, @opt)
    dec = encryptor.decrypt(enc, @key, @opt)
    expect(dec).to eq text
  end
end
