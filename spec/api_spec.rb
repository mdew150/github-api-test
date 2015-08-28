require 'json'
require_relative './spec_helper'

describe 'GitHub API https://api.github.com/' do
  let(:url) { "curl https://api.github.com#{path} -s -S" }
  let(:response_body) { `#{url}` }
  let(:json) { JSON.parse(response_body, symbolize_names: true) }

  describe '/' do
    let(:path) { '/' }
    it 'has an entry' do
      expect(json[:emojis_url]).to eq('https://api.github.com/emojis')
      expect(json.keys.size).to eq(29)
    end
  end

  describe '/emojis' do
    let(:path) { '/emojis' }
    it 'has an entry' do
      expect(json[:a]).to match(/\.png/)
      expect(json.keys.size).to eq(888)
    end
  end
end
