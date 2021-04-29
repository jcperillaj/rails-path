require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:user) { User.first }
  let(:article) { create(:article, author: user) }
  let(:article_params) { attributes_for(:article) }

  before(:each) do
    sign_in(user)
  end

  context '#index' do
    subject { get :index }

    it { should be_successful }
    it { should render_template(:index) }
  end

  context '#show' do
    subject {get :show}
  end

  context '#create' do
    subject {post :create, params: { :article => article_params } }

    it { expect(subject).to redirect_to article_url(id: Article.last.id) }
  end

  context '#update' do

    subject {patch :update, params: { id: Article.last.id , article: article_params } }
    it 'should redirect to the updated article page' do
      new_title = 'Another Title'
      article_params[:title] = new_title
      expect(subject).to redirect_to article_url(id: Article.last.id)
      expect(Article.last.title).to eq new_title
    end
  end

  context '#delete' do
    subject {delete :destroy, params: {id: Article.first.id}}

    it {expect(subject).to redirect_to root_path}
  end

end
