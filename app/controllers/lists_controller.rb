class ListsController < ApplicationController

before_action :set_list, :only => [ :show, :edit, :update, :destroy, :completed ]


  def index
    @lists = List.all
    @lists = List.order(date: :asc)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url
    else
      render :new
    end
  end

  def new
    @list = List.new
  end


  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy

    if Date.current > List.find(params[:id]).date
      redirect_to lists_path, :flash => { :notice => "You cannot delete an overdue task." }
    else
      @list.destroy    
      redirect_to lists_url
    end
  end
    

  def completed
    @list.update(completed: !(@list.completed))
  end



  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :date, :description)
  end


end
