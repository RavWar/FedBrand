class NewsController < ApplicationController
  def index
  end

  def tags
    tag = ActsAsTaggableOn::Tag.find_by_slug params[:tag]
    @news = News.tagged_with tag
  end

  def show
    @news = News.find params[:id]
  end
end