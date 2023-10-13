# spec/cutword_spec.rb
require 'spec_helper'
require_relative '../lib/cutword'

describe Cutword do
  describe '.get' do
    it 'returns the input text when text length is less than max_length' do
      result = Cutword.get('This is a short text', 100)
      expect(result).to eq('This is a short text')
    end

    it 'truncates and appends "..." when text length is greater than max_length' do
      result = Cutword.get('This is a long text that needs truncation', 10)
      expect(result).to end_with('...')
    end
  end
end
