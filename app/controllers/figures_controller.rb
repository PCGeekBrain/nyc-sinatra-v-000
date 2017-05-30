class FiguresController < ApplicationController
  get '/figures' do
    erb :"figures/index"
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.landmarks.create(params[:landmark]) unless params[:landmark][:name] == ""
    figure.titles.create(params[:title]) unless params[:title][:name] == ""
    redirect "/figures/#{figure.id}"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end
  post '/figures/:id/edit' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.landmarks.create(params[:landmark]) unless params[:landmark][:name] == ""
    figure.titles.create(params[:title]) unless params[:title][:name] == ""
    redirect "/figures/#{figure.id}"
  end
end
