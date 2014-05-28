require 'test_helper'

class GenericControllerTest < ActionController::TestCase
  tests PagesController
  
  context "with a maestrano session" do
    setup do
      @request.session[:mno_uid] = 'usr-1'
      @request.session[:mno_session] = 'fdsf544fd5sd4f'
      @request.session[:mno_session_recheck] = Time.now.utc.iso8601
      @request.session[:mno_group_uid] = 'cld-1'
    end
  
    should "be successful if the maestrano session is still valid" do
      sso_session = mock('maestrano_sso_session')
      sso_session.stubs(:valid?).returns(true)
      Maestrano::SSO::Session.stubs(:new).returns(sso_session)
      get :home
      assert_response :success
    end
    
    should "initialize redirect to SSO initialization if invalid" do
      sso_session = mock('maestrano_sso_session')
      sso_session.stubs(:valid?).returns(false)
      Maestrano::SSO::Session.stubs(:new).returns(sso_session)
      get :home
      assert_redirected_to Maestrano::SSO.init_url
    end
  end
  
  context "with no maestrano session" do
    should "be successful" do
      get :home
      assert_response :success
    end
  end
  
end