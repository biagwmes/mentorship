class MentoringsController < ApplicationController
  before_action :set_mentoring, only: %i[ show edit update destroy ]

  def index
    @mentorings = Mentoring.all
    @mentors = Mentor.all
    @mentees = Mentee.all
  end

  def show
  end

  def new
    @mentoring = Mentoring.new
    @mentors = Mentor.all
    @mentees = Mentee.all
  end

  def edit
    @mentors = Mentor.all
    @mentees = Mentee.all
  end

  def create
    @mentoring = Mentoring.new(mentoring_params)

    respond_to do |format|
      if @mentoring.save
        format.html { redirect_to @mentoring, notice: "Mentoring was successfully created." }
        format.json { render :show, status: :created, location: @mentoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mentoring.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mentoring.update(mentoring_params)
        format.html { redirect_to @mentoring, notice: "Mentoring was successfully updated." }
        format.json { render :show, status: :ok, location: @mentoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mentoring.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mentoring.destroy!

    respond_to do |format|
      format.html { redirect_to mentees_path, status: :see_other, notice: "Mentoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentoring
      @mentoring = Mentoring.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mentoring_params
      params.expect(mentoring: [ :mentor_id, :mentee_id ])
    end
end
