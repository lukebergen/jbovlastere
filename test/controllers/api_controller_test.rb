require "minitest_helper"

describe ApiController do

  let(:api_key) {ApiKey.first}

  before(:each) do
    def @controller.params
      {_token: '1234567890'}
    end
  end

  describe '.current_user' do

    it 'returns an api key' do
      @controller.current_user.must_equal(api_key)
    end

    it 'raises JbovlastereError::ApiKeyNotFound when illegitimate token' do
      def @controller.params; {_token: 'bad_token'}; end
      assert_raises(JbovlastereError::ApiKeyNotFound) { @controller.current_user }
    end

    it 'raises JbovlastereError::ApiKeyNotSupplied when not token supplied' do
      def @controller.params; {}; end
      assert_raises(JbovlastereError::ApiKeyNotSupplied) { @controller.current_user }
    end
  end

  describe '.authenticate!' do

    it 'calls current_user' do
      must_send([@controller, :current_user])
      @controller.authenticate!
    end
  end

end
