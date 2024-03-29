class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def friends
    @friends = Friendship.find_all_by_first_user_id(params[:id]) | Friendship.find_all_by_second_user_id(params[:id])
    respond_to do |format|
      format.json {render json: @friends}
    end
  end

  def pres
    @user = User.find(params[:id])
    @invites = Invite.find_all_by_user_id(params[:id])
    @pres = Array.new

    #this is BAD CODE
    @invites.each do |invite|
      @pre = Pre.find(invite.pre_id)
      @pre.status=invite.status
      @pres.push @pre
    end

    @pre = Pre.find_by_owner(params[:id])
    if @pre != nil
      @pre.status='owner'
      @pres.push @pre
    end



    respond_to do |format|
      format.json {render json: @presf}
    end
  end

  def pre
    pre_id = "%#{params[:pre_id]}%"
    user_id = "%#{params[:id]}%"
    @invites = Invite.where('pre_id LIKE ? AND user_id LIKE ?', pre_id, user_id)
    if @invites.count >= 1
      @invite = @invites[0]
    end

    @pre = Pre.find(@invite.pre_id)

    @pre.status=@invite.status if @pre != nil

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pre}
    end
  end
end
