# spec/cutword_spec.rb

require 'spec_helper'
require_relative '../lib/cutword'

describe 'Cutword' do
  it 'truncates text longer than max_length and appends "..."' do
    result = Cutword(10, 'This is a long text that needs truncation')
    expect(result).to eq('This is a...')
  end

  it 'returns the original text if length is less than or equal to max_length' do
    result = Cutword(100, 'This is a short text')
    expect(result).to eq('This is a short text')
  end
end
