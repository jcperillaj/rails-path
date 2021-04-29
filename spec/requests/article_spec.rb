require 'rails_helper'

RSpec.describe ArticlesController, type: :request do

  let(:article_double) { double("article_double") }
  before(:each) do
    allow(Article).to receive(:new).and_return(article_double)
    get '/articles/new'
  end

  it "request list of all articles" do
    # article = Article.create(name: "Test article")
    get '/articles'
    expect(response).to be_successful
    expect(response.body).to include(article_double)
  end

  # it "creates a new item" do
  #   expect(assigns(:article)).to be(article_double)
  # end

  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
