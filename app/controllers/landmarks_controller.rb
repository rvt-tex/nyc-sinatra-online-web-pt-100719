class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    if landmark.save
      redirect to "/landmarks/#{landmark.id}"
    end
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    if @landmark
      erb :'/landmarks/show'
    else
      "Content not found"
    end
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    if @landmark
      erb :'/landmarks/edit'
    else
      "Content not found"
    end
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    if landmark.save
      redirect to "/landmarks/#{landmark.id}"
    end
  end
end