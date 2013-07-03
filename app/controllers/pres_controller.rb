class PresController < ApplicationController
  # GET /pres
  # GET /pres.json
  def index
    @pres = Pre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pres }
    end
  end

  def users
    @pre = Pre.find(params[:id])
    @users = @pre.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def user
    @pre = Pre.find(params[:id])
    @user = @pre.users.find(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /pres/1
  # GET /pres/1.json
  def show
    @pre = Pre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pre }
    end
  end

  # GET /pres/new
  # GET /pres/new.json
  def new
    @pre = Pre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pre }
    end
  end

  # GET /pres/1/edit
  def edit
    @pre = Pre.find(params[:id])
  end

  # POST /pres
  # POST /pres.json
  def create
    @pre = Pre.new(params[:pre])

    respond_to do |format|
      if @pre.save
        format.html { redirect_to @pre, notice: 'Pre was successfully created.' }
        format.json { render json: @pre, status: :created, location: @pre }
      else
        format.html { render action: "new" }
        format.json { render json: @pre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pres/1
  # PUT /pres/1.json
  def update
    @pre = Pre.find(params[:id])

    respond_to do |format|
      if @pre.update_attributes(params[:pre])
        format.html { redirect_to @pre, notice: 'Pre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pres/1
  # DELETE /pres/1.json
  def destroy
    @pre = Pre.find(params[:id])
    @pre.destroy

    respond_to do |format|
      format.html { redirect_to pres_url }
      format.json { head :no_content }
    end
  end
end
