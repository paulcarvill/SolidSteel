require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end

    it "loads the latest mix into @mix" do
      mix1, mix2 = Mix.create!(name: "foo", url: "http://foo"), Mix.create!(name: "bar", url: "http://bar")
      get :home

      expect(assigns(:mix)).to match(mix1)
    end
  end

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

end
