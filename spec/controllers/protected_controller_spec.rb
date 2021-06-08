require 'rails_helper'

describe ProtectedController do
  let(:user) { Fabricate(:user) }
  
  describe 'require_authentication' do
    context 'given a valid authorization header' do
      it 'returns a 200' do
        request.headers['Authorization'] = user.jwt
        expect(described_class.new.require_authentication).to eq(true)
      end
    end
  end
end