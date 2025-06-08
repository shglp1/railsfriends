class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[show edit update destroy]

  # GET /friends
  def index
    @friends = current_user.friends.order(:firstName)
  end

  # GET /friends/1
  def show; end

  # GET /friends/new
  def new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit; end

  # POST /friends
  def create
    @friend = current_user.friends.build(friend_params)

    if @friend.save
      redirect_to @friend, notice: 'Friend was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy!
    redirect_to friends_path, notice: 'Friend was successfully destroyed.', status: :see_other
  end

  private

  # Finds the record that belongs to the signed-in user only
  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

  # Strong parameters – NO :user_id here
  def friend_params
    params.require(:friend).permit(:firstName, :lastName, :phone, :gender)
  end
end
