require_relative './spec_helper'

describe 'GitHub API https://api.github.com/' do
  let(:url) { "https://api.github.com#{path}" }
  let(:method) { :get }
  let(:params) { {} }
  let(:response) { RestClient.send(method, url, params) }
  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  describe 'GET /' do
    let(:path) { '/' }
    it 'has an entry' do
      expect(json[:emojis_url]).to eq('https://api.github.com/emojis')
      expect(json.keys.size).to eq(29)
      expect(response.code).to eq(200)
    end
  end

  describe 'GET /emojis' do
    let(:path) { '/emojis' }
    it 'has an entry' do
      expect(json[:a]).to match(/\.png/)
      expect(json.keys.size).to eq(888)
      expect(response.code).to eq(200)
    end
  end
end
