class PresController < ApplicationController
  # GET /pres
  # GET /pres.json

  RAD_PER_DEG = 0.017453293
  R_MILES = 3956           # radius of the great circle in miles
  R_KM = 6371              # radius in kilometers...some algorithms use 6367
  R_FEET = R_MILES * 5282   # radius in feet
  R_METERS = R_KM * 1000


  def index
    @pres = Pre.all
    @pres_with_owner = Array.new

    @pres.each  do |pre|
      @pre_with_owner = Array.new

      @pre_with_owner.push pre
      @owner = User.find(pre.owner)
      @pre_with_owner.push  @owner
      @pres_with_owner.push @pre_with_owner
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pres_with_owner }
    end
  end

  def users
    @pre = Pre.find(params[:id])
    @invites = Invite.find_all_by_pre_id(params[:id])

    @users = Array.new

    #this is BAD CODE
    @invites.each do |invite|
      @user = User.find(invite.user)
      @user.pre_status=invite.status
      @users.push @user
    end

    @user = User.find(@pre.owner)
    @user.pre_status='owner'
    @users.push @user


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def user
    user_id = "%#{params[:user_id]}%"
    pre_id = "%#{params[:id]}%"
    @invites = Invite.where('user_id LIKE ? AND pre_id LIKE ?', user_id, pre_id)
    @invite = @invites[0]
    @user = User.find(@invite.user_id)
    @user.pre_status=@invite.status

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /pres/1
  # GET /pres/1.json
  def show
    @pre_with_owner = Array.new
    @pre = Pre.find(params[:id])
    @pre_with_owner.push @pre
    @pre_with_owner.push User.find(@pre.owner)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pre_with_owner }
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
    @pres = Pre.all
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

  def closest_pres
    @pres = Pre.all
    @pre = Pre.find(params[:id])

    @pres.delete(@pre)
    closest_pres = Array.new

    @pres.each do |pre|

      pre.distance = haversine_distance(pre.latitude,pre.longitude,@pre.latitude,@pre.longitude)
      @affiliations = Affiliation.where('first_pre_id LIKE ? AND second_pre_id LIKE ?', @pre.id, pre.id )

      if (@affiliations.count == 1)
        @affiliation = @affiliations[0]
        pre.status = @affiliation.relationship
      end

      closest_pres.push pre
    end

    closest_pres.sort! { |a,b| a.distance <=> b.distance}
    offset = params[:offset].to_i
    count = params[:count].to_i
    closest_pres = closest_pres[offset,count]

    respond_to do |format|
      format.json { render json: closest_pres }
    end

  end

  def haversine_distance( lat1, lon1, lat2, lon2 )

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    dlon_rad = dlon * RAD_PER_DEG
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = lat1 * RAD_PER_DEG
    lon1_rad = lon1 * RAD_PER_DEG

    lat2_rad = lat2 * RAD_PER_DEG
    lon2_rad = lon2 * RAD_PER_DEG

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    #dMi = Rmiles * c          # delta between the two points in miles
    #dKm = Rkm * c             # delta in kilometers
    #dFeet = Rfeet * c         # delta in feet
    dMeters = R_METERS * c     # delta in meters

    #@distances["mi"] = dMi
    #@distances["km"] = dKm
    #@distances["ft"] = dFeet
    @distance = dMeters
  end

end
