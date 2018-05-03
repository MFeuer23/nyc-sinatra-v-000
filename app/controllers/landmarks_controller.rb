class LandmarksController < ApplicationController

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get "/landmarks/new" do
    erb :'/landmarks/new'
  end

  post "/landmarks" do
    @landmarks = Landmark.create(params["landmark"])
    redirect "/landmarks/#{@landmarks.id}"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
end
