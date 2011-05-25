class SearchController < ApplicationController
  
  def index
    if params[:q]
      @search = Paragraph.search do
        keywords params[:q]
      end
    end
    render :layout => false if pjax_request?
  end
  
end
