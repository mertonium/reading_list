class ListsController < ApplicationController
  def new
    @list = List.new(state: List::DRAFT, subject: '[Eng Reading List]')

    if params[:item_ids].present?
      @list.build_body_from_items(params[:item_ids].split(',').map(&:to_i))
    end
  end
end
