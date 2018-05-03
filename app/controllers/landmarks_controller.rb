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
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure"]["name"])

    @figure.titles.clear
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
       @figure.titles << Title.find(id)
      end
    end
  if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    @figure.landmarks.clear
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
       @figure.landmarks << Landmark.find(id)
      end
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
end
