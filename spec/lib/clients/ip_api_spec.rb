require './spec/spec_helper'

RSpec.describe IchiApi::Clients::IpApi, type: :client do
  subject { described_class.new(ip) }
  let(:ip) { '186.114.41.249' }
  let(:headers) { { 'Content-Type': 'application/json' } }
  let(:url) { "#{url_ip_api}/json/#{ip}?key=#{token}&fields=#{fields}&lang=es" }
  let(:http_party_mock) { double(HTTParty, to_hash: {}) }
  let(:token) { 'G6943LMReKj_kqdAVrAiPbpRloAfE1fqp0eVAJ' }
  let(:url_ip_api) { 'https://pro.ip-api.com' }

  let(:fields) do
    'currency,status,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,'\
    'org,as,query'
  end

  before do
    allow(HTTParty).to receive(:get).and_return(http_party_mock)
    allow(subject).to receive(:token).and_return(token)
  end

  describe '#search_location' do
    context 'when call location' do
      it 'calls ip api' do
        subject.search_location

        expect(HTTParty).to have_received(:get).with(url, headers: headers)
      end
    end
  end
end
