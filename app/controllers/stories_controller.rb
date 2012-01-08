class StoriesController < ApplicationController

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:notice] = 'Story saved'
      redirect_to stories_path
    else
      flash[:error] = 'Story not saved'
      render 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = 'Story saved'
      redirect_to stories_path
    else
      flash[:error] = 'Story not saved'
      render 'show'
    end
  end

  def new
    @story = Story.new(params[:story])
  end

  def index
    @stories = Story.all
    @story = Story.new(params[:story])
  end

end
