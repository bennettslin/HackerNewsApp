class VotesController < ApplicationController

  def create
    if params.key? :comment_id
      votable = Comment.find(params[:comment_id])
      @post = Post.find(params[:post_id])
      return_page = @post
    elsif params.key? :post_id
      votable = Post.find(params[:post_id])
      return_page = :posts
    elsif params.key? :user_id
      votable = User.find(params[:user_id])
      return_page = :users
    else
      return render plain: "Invalid input. Stop it!"
    end

    @vote = votable.votes.find_by_user_id(current_user.id)

    if @vote.nil?
      @vote = votable.votes.create(vote_params)
      current_user.ratings << @vote
      flash[:success] = "New vote successful."

    else
      if (params[:vote][:value].to_i != @vote.value)
        @vote.value = params[:vote][:value]
        flash[:success] = "Vote change successful."
      else
        flash[:danger] = "You already voted on that."
      end
    end

    if @vote.present? && @vote.save

      # respond_to do |format|
      #   format.json { render json: {result: true, votes: votable.votes}}
      #   format.html { redirect_to return_page}
      # end
      redirect_to return_page
    else
      flash[:danger] = "Vote was not created."
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
