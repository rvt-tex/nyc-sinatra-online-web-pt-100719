class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :"/figures/new"
  end

  post '/figures' do
    figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.new(name:params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(name:params[:landmark][:name])
    end

    if figure.save
      redirect to "/figures/#{figure.id}"
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    if @figure
      erb :'/figures/show'
    else
      "Content not found"
    end
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    if @figure
      erb :'/figures/edit'
    else
      "Content not found"
    end
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    figure.title_ids = params[:figure][:title_ids]
    figure.landmark_ids = params[:figure][:landmark_ids]

    if !params[:title][:name].empty?
      figure.titles << Title.new(name:params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(name:params[:landmark][:name])
    end

    figure.save

    if figure.save
      redirect to "/figures/#{figure.id}"
    end
  end
end