class ListsController < ApplicationController

    def index
      @lists = List.all
    end

    def show
      @list = List.find(params[:id])
      @bookmarks = @list.bookmarks
    end

    def new
      @list = List.new
      @bookmarks = @list.bookmarks
    end

    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to @list, notice: 'List was successfully created.'
      else
        render :new
      end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def list_params
      params.require(:list).permit(:name)
    end

end
