require 'test_helper'

class ContentPagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ContentPage.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ContentPage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ContentPage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to content_page_url(assigns(:content_page))
  end
  
  def test_edit
    get :edit, :id => ContentPage.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ContentPage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ContentPage.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ContentPage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ContentPage.first
    assert_redirected_to content_page_url(assigns(:content_page))
  end
  
  def test_destroy
    content_page = ContentPage.first
    delete :destroy, :id => content_page
    assert_redirected_to content_pages_url
    assert !ContentPage.exists?(content_page.id)
  end
end
