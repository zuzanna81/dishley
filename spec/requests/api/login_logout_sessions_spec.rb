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
end
