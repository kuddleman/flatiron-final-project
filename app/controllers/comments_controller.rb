class CommentsController < ApplicationController
  before_action :require_signin
  before_action :set_product

  def create
    #get product object first, and use it to create comment
    @comment = product.comments.build(comment_params)
    @comment.user = current_user
    # the above is the same as @comment.user.id = current_user.id

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to @product

      #this is a redirect to product show page.
      # @product is a shortcut for product_path(@product.id)
    else
      @comments = @poduct.comments
      flash.now[:alert] = "Comment has not been created"
      render 'products/show'
    end
  end

  private

  def set_product
    # there will be only one product in this array 
    # created below, so we can just take the first (and only)
    #element to retrieve it.
    @product = Product.where(id: params[:product_id]).first
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end