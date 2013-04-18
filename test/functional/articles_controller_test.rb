require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get search with title param" do
    neo = Article.create title: 'Neo Singapore is awesome'
    new_context = Article.create title: 'New Context Singapore is no longer there'

    get :search, format: :json, title: 'Neo Singapore'
    assert_response :success
    assert_include assigns(:articles), neo
    assert_not_include assigns(:articles), new_context
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { latitude: @article.latitude, longitude: @article.longitude, title: @article.title, url: @article.url }, format: :json
    end

    assert_response 201
  end

  test "should show article" do
    get :show, id: @article, format: :json
    assert_response :success
  end

  test "should update article" do
    put :update, id: @article, article: { latitude: @article.latitude, longitude: @article.longitude, title: @article.title, url: @article.url }
    assert_response 204
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_response 204
  end
end
