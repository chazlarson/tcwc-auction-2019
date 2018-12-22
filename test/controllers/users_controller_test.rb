require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # BEGIN: SHOW
  # BEGIN: show-public
  test 'should redirect profile page when not logged in' do
    get user_path(@u1)
    assert_redirected_to root_path
    get user_path(@u2)
    assert_redirected_to root_path
    get user_path(@u3)
    assert_redirected_to root_path
    get user_path(@u4)
    assert_redirected_to root_path
    get user_path(@u5)
    assert_redirected_to root_path
    get user_path(@u6)
    assert_redirected_to root_path
    get user_path(@u7)
    assert_redirected_to root_path
  end
  # END: show-public

  # BEGIN: show-other_user
  test 'should redirect users from profiles other than their own' do
    sign_in @u1, scope: :user
    get user_path(@u2)
    assert_redirected_to root_path
    get user_path(@u3)
    assert_redirected_to root_path
    get user_path(@u4)
    assert_redirected_to root_path
    get user_path(@u5)
    assert_redirected_to root_path
    get user_path(@u6)
    assert_redirected_to root_path
    get user_path(@u7)
    assert_redirected_to root_path
  end
  # END: show-other_user

  # BEGIN: show-self
  test 'should not redirect users from their own profiles' do
    sign_in @u1, scope: :user
    get user_path(@u1)
    assert_response :success
  end
  # END: show-self

  # BEGIN: show-regular_admin
  test 'should not redirect profile page when logged in as a regular admin' do
    sign_in @a4, scope: :admin
    get user_path(@u1)
    assert_response :success
    get user_path(@u2)
    assert_response :success
    get user_path(@u3)
    assert_response :success
    get user_path(@u4)
    assert_response :success
    get user_path(@u5)
    assert_response :success
    get user_path(@u6)
    assert_response :success
    get user_path(@u7)
    assert_response :success
  end
  # END: show-regular_admin

  # BEGIN: show-super_admin
  test 'should not redirect profile page when logged in as a super admin' do
    sign_in @a1, scope: :admin
    get user_path(@u1)
    assert_response :success
    get user_path(@u2)
    assert_response :success
    get user_path(@u3)
    assert_response :success
    get user_path(@u4)
    assert_response :success
    get user_path(@u5)
    assert_response :success
    get user_path(@u6)
    assert_response :success
    get user_path(@u7)
    assert_response :success
  end
  # END: show-super_admin
  # END: SHOW
end
