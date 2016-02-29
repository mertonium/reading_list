class ListsController < ApplicationController
  def new
    @list = List.new(state: List::DRAFT, subject: '[Eng Reading List]')

    if params[:item_ids].present?
      @item_ids = params[:item_ids].split(',').map(&:to_i)
      @list.build_body_from_items(@item_ids)
    end
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    else
      render 'edit'
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def index
    @lists = List.order("sent_at DESC")
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list)
      .permit(:subject, :body, :state, :sent_at, :item_ids)
  end
end
