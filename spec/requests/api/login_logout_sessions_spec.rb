require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/auth/sign_in' do
    it 'valid credentials returns user' do
      post '/api/auth/sign_in', params: {
        email: user.email, password: user.password
      }, headers: headers

      expected_response = { 'id' => user.id,
                            'email' => user.email.to_s,
                            'provider' => user.provider.to_s,
                            'uid' => user.uid.to_s,
                            'type' => 'user' }

      expect(JSON.parse(response.body)['data']).to eq expected_response
    end
  end

    it 'invalid password returns error message' do
      post '/api/auth/sign_in', params: {
        email: user.email, password: 'wrong_password'
      }, headers: headers

      expect(JSON.parse(response.body)['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end

    it 'invalid email returns error message' do
      post '/api/auth/sign_in', params: {
        email: 'wrong@email.com', password: user.password
      }, headers: headers

      expect(JSON.parse(response.body)['errors'])
        .to eq ['Invalid login credentials. Please try again.']
      expect(response.status).to eq 401
    end
end
