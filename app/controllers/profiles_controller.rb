class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index

    # @profile = Profile.where(user_id: current_user.id).first
    @profile = Profile.find_by(user_id: current_user.id)
    # these above two lines work in same
    
    # there is difference between .where and .find_by and .find methodes
    # .where return an array. to be able to read this array we need to a loop (eg. each loop) or .first .last or [0] methodes
    # .find_by return the first object found.
    # . find  return the object the object we are looking for

    # example:
    # Person table
    #  id| name
    #   1|  luke
    #   2|  Mathew
    #   3|  Ali
    #   4|  luke
    #   5| Ali
    #   6| Ali

    # person.find (id:1)  return luke
    # Person.find_by (first_name:"ALi") returen ALi just for id: 3
    # person.where(first_name:"ali") return [Ali,ALi,ALi]

    # more information :
    # http://guides.rubyonrails.org/active_record_querying.html

  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :username, :age, :gender, :user_id, :picture)
    end
end
