require 'rails_helper'

describe Api::V1::LocationsController, type: :request, vcr: true do
  let(:json_body)   { JSON.parse(response.body) }
  let(:headers)     { { 'Content-Type' => 'application/json' } }
  let(:url)         { 'https://ipstack.com' }
  let(:invalid_url) { 'https://ipstack.comm' }
  let(:invalid_ip)  { '111.2' }
  let(:valid_ip)    { '172.67.73.233' }

  describe 'POST api/v1/location' do
    context 'when ip in params' do
      let(:params) { { location: { ip: valid_ip } } }

      it 'creates location' do
        post(api_v1_location_path, params:, headers:, as: :json)

        expect(response).to be_successful
        location = Location.find_by(ip: valid_ip)
        expect(JSON.parse(location.geo_data)['zip']).to eq('94107')
      end
    end

    context 'when geo provider cant find location' do
      let(:params)             { { location: { ip: invalid_ip } } }
      let(:response_error_msg) { 'The IP Address supplied is invalid.' }

      it 'does not create location' do
        post(api_v1_location_path, params:, headers:, as: :json)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body['errors'][0]['title']).to eq(response_error_msg)
      end
    end

    context 'when no ip and invalid url params' do
      let(:params) { { location: { url: invalid_url } } }

      it 'does not create location' do
        post(api_v1_location_path, params:, headers:, as: :json)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body['errors'][0]['title']).to eq(I18n.t('api.v1.exceptions.invalid_ip_presence'))
      end
    end

    context 'when no ip and no url in params' do
      let(:params) { { location: { ip: '', url: '' } } }

      it 'does not create location' do
        post(api_v1_location_path, params:, headers:, as: :json)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body['errors'][0]['title']).to eq(I18n.t('api.v1.exceptions.invalid_ip_presence'))
      end
    end
  end

  describe 'GET api/v1/location' do
    let!(:location) { create(:location) }

    context 'when ip in params' do
      let(:params) { { location: { ip: location.ip } } }

      it 'returns location' do
        get(api_v1_location_path, params:, headers:)

        expect(response).to be_successful
        expect(json_body.dig('data', 'attributes', 'geo_data')).to eq(location.geo_data)
      end
    end

    context 'when url in params' do
      let(:params) { { location: { url: } } }

      it 'returns location' do
        get(api_v1_location_path, params:, headers:)

        expect(response).to be_successful
        expect(json_body.dig('data', 'attributes', 'geo_data')).to eq(location.geo_data)
      end
    end

    context 'when not found by ip' do
      let(:params) { { location: { ip: invalid_ip } } }

      it 'returns 404' do
        get(api_v1_location_path, params:, headers:)

        expect(response).to have_http_status(:not_found)
        expect(json_body['errors'][0]['title']).to eq(I18n.t('api.v1.exceptions.record_not_found'))
      end
    end

    context 'when not found by url' do
      let(:params) { { location: { url: invalid_url } } }

      it 'returns 404' do
        get(api_v1_location_path, params:, headers:)

        expect(response).to have_http_status(:not_found)
        expect(json_body['errors'][0]['title']).to eq(I18n.t('api.v1.exceptions.record_not_found'))
      end
    end
  end

  describe 'DELETE api/v1/location' do
    let!(:location) { create(:location) }
    let(:params)    { { location: { ip: location.ip } } }

    it 'deletes location' do
      delete(api_v1_location_path, params:, headers:, as: :json)

      expect(response).to have_http_status(:no_content)
      expect(Location.exists?(location.id)).to be_falsey
    end
  end
end
