RSpec.describe ApplicationController, type: :controller do
  let(:json_request) { 'application/json' }
  let(:valid_json_type) { 'application/json; charset=utf-8' }
  let(:html_request) { 'text/html' }
  let(:valid_html_type) { 'text/html; charset=utf-8' }
  let(:valid_token) { 'validAPItoken1234567' }

  context 'when setting the default response format' do

    context 'when using the API app type' do
      before do
        ENV['REAL_STATE_APP_TYPE'] = 'API'
      end

      it 'always uses JSON for the response format' do
        request.accept = html_request
        get :index
        expect(response.header['Content-Type']).to eq valid_json_type
      end
    end

    context 'when using the HTML app type' do
      before do
        ENV['REAL_STATE_APP_TYPE'] = 'HTML'
      end

      it 'always uses HTML for the response format' do
        request.accept = json_request
        get :index
        expect(response.header['Content-Type']).to eq valid_html_type
      end
    end

    context 'when no app type is set' do
      before do
        ENV['REAL_STATE_APP_TYPE'] = nil
      end

      it 'responds with JSON format when asked' do
        request.accept = json_request
        get :index
        expect(response.header['Content-Type']).to eq valid_json_type
      end

      it 'responds with HTML format when asked' do
        request.accept = html_request
        get :index
        expect(response.header['Content-Type']).to eq valid_html_type
      end
    end

  end

  context 'when authenticating via token' do
    before do
      User.stubs(:where).with(anything).returns([])
      User.stubs(:where).with(api_auth_token: valid_token).returns([User.new(email: 'test@user.com', confirmed_at: DateTime.now)])
      stubs(:sign_in).with(responds_with(:email, 'test@user.com'), {store: false})
    end

    it 'fails authentication with no token present' do
      request.accept = json_request
      get :index
      expect(response.body).to eq({error: 'You need a valid token before continuing.'}.to_json)
    end

    it 'fails authentication with an invalid token' do
      request.accept = json_request
      get :index, params: { token: 'blah' }
      expect(response.body).to eq({error: 'You need a valid token before continuing.'}.to_json)
    end

    it 'authentication is successful with a valid token' do
      request.accept = json_request
      get :index, params: { token: valid_token }
      expect(response.body).to eq({result: :success}.to_json)
    end
  end

  context 'db records are not being deleted in controller specs, so must do manually' do
    before do
      User.destroy_all
    end

    context 'when authenticating via login session' do
      let(:valid_user) { create(:user) }

      it 'fails authentication with invalid session' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end

      it 'authentication is successful with valid session' do
        sign_in valid_user
        get :index
        expect(response.body).to eq 'success'
      end
    end

    context 'when verifying an admin is logged in' do
      let(:valid_user) { create(:user, api_auth_token: valid_token) }
      let(:valid_admin_token) { 'validAPItoken1234560' }
      let(:valid_admin) { create(:admin, api_auth_token: valid_admin_token) }

      context 'when requestion HTML format' do
        before do
          request.accept = html_request
        end

        it 'fails authentication with non-admin user' do
          sign_in valid_user
          get :admin
          expect(flash['alert']).to eq "Only admins are allowed to interact with application!"
        end

        it 'authentication succeeds with admin user' do
          sign_in valid_admin
          get :admin
          expect(response.body).to eq 'success'
        end
      end

      context 'when requestion JSON format' do
        before do
          request.accept = json_request
        end

        it 'fails authentication with non-admin user' do
          sign_in valid_user
          get :admin, params: { token: valid_token }
          expect(response.body).to eq({error: "Only admins are allowed to interact with application!"}.to_json)
        end

        it 'authentication succeeds with admin user' do
          sign_in valid_admin
          get :admin, params: { token: valid_admin_token }
          expect(response.body).to eq({result: :success}.to_json)
        end
      end
    end
  end
end