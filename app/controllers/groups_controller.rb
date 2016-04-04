class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    userid =  session[:user_id]
    # @groups = Group.all
    # grabs the groups based on the user logged in
    @groups = Group.joins(:user).where(:users => {:id => userid})
    
    # I need groups that are upcoming
    @upcomingGroups = Group.joins(:user).where(:users => {:id => userid})
    
    # Then the rest of the groups that are not upcoming
    @restGroups = Group.joins(:user).where(:users => {:id => userid})
  end
  
  def searchGroupEvent
    @events = Event.where("what LIKE ?", "%"+params[:search]+"%")
    @groups = Group.where("name LIKE ?", "%"+params[:search]+"%")
    respond_to do |format|
      format.json  { render :json => { :group => @groups, :event => @events}}
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    currentGroup = Group.find_by_id(params[:id])
    
    # get creator
    groupInfo = Group.joins(:user).where(:users => {:id => currentGroup.who_created_id})[0]
    @groupCreator = groupInfo.user.firstname+" "+groupInfo.user.lastname
    
    # get Events
    @events = Event.joins(:group).where(:groups => {:id => params[:id]})
    
    # Get Members
    @members = Member.joins(:user).joins(:group).where(:groups => {:id => params[:id]})
    
  end

  # GET /groups/new
  def new
    @group = Group.new
    # Need some logic from members joint table
    @availMembers = User.where("1 = 0")
  end

  # GET /groups/1/edit
  def edit
    # Need some logic from members joint table
    @availMembers = User.where("1 = 0")
  end

  # POST /groups
  # POST /groups.json
  def create
    # initialize the group variable
    @group = Group.new

    @group.name = group_params[:name]
    
    @group.description = group_params[:description]

    # image? not sure how we will do this one
    @group.image = group_params[:image]

    # date created and updated will be now
    @group.datetime_created = Date.today.to_datetime
    @group.datetime_updated = Date.today.to_datetime

    # for new groups, the creator and editor is the person who is signed in
    @group.who_created_id = session[:user_id]
    @group.who_updated_id = session[:user_id]

    # Send to location to get the based_in_id
    # locationId = Location.getLocationId(group_params[:city],group_params[:state])
    # if(locationId)
      # @group.based_in_id = locationId
    # else
      # @group.based_in_id = Location.createByCityState(group_params[:city],group_params[:state])
    # end
    
    #Take list and add them as members
    memberParams = params[:group][:members]
    if(memberParams != nil)
      memberParams = memberParams.split(",")
    end
    # membersParam = group_params[:members].split(",")

    respond_to do |format|
      if @group.save
        
       # Needed to do the save in here because I needed to group ID
        memberParams.each do |x| 
          member = Member.new
          member.user_id = x
          member.group_id = @group.id
          member.save
        end 
        
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
        format.json { render :index, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    
    @group.who_updated_id = session[:user_id]
    
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :image, :who_created_id, :datetime_created, :who_updated_id, :datetime_updated, :based_in_id)
    end
end
