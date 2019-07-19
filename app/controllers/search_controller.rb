class SearchController < ApplicationController
  def index
    render locals: {
      facade: MemberSearchFacade.new(params[:house])
    }
  end
end
