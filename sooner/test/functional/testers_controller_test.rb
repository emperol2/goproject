require 'test_helper'

class TestersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Tester.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Tester.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Tester.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tester_url(assigns(:tester))
  end

  def test_edit
    get :edit, :id => Tester.first
    assert_template 'edit'
  end

  def test_update_invalid
    Tester.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tester.first
    assert_template 'edit'
  end

  def test_update_valid
    Tester.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tester.first
    assert_redirected_to tester_url(assigns(:tester))
  end

  def test_destroy
    tester = Tester.first
    delete :destroy, :id => tester
    assert_redirected_to testers_url
    assert !Tester.exists?(tester.id)
  end
end
