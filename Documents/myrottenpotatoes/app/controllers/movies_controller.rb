#This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id] # Retrieve movie ID from URI route
    @movie = Movie.find(id) # To look up movie by unique ID
    # Will render app/views/movies/show.html.haml by default
  end

  def new
   #  default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
   @movie = Movie.find params[:id]
   @movie.update_attributes!(params[:movie])
   flash[:notice] = "#{@movie.title} was successfully updated."
   redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
