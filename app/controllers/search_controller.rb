class SearchController < ApplicationController
  
  def index
    if params[:q]
      @search = Paragraph.search do
        keywords params[:q]
      end
    end
  end
  
end
