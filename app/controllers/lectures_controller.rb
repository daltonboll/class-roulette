class LecturesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :index, :new, :create, :refresh_messages]
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :refresh_messages]
  

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # GET /lectures/new
  def new
    if not user_signed_in? or not current_user.is_admin
      redirect_to course_lectures_path(@course)
    else
      @lecture = Lecture.new
    end
  end

  # GET /lectures/1/edit
  def edit
    if not user_signed_in? or not current_user.is_admin
      redirect_to course_lecture_path(@course, @lecture)
    end
  end

  # POST /lectures
  # POST /lectures.json
  def create
    if not user_signed_in? or not current_user.is_admin
      redirect_to course_lectures_path(@course)
    else
      year = lecture_params["time(1i)"]
      month = lecture_params["time(2i)"]
      day = lecture_params["time(3i)"]
      hour = lecture_params["time(4i)"]
      minute = lecture_params["time(5i)"]
      time = Time.zone.local(year, month, day, hour, minute)

      weekday = lecture_params[:day]

      @lecture = Lecture.new(day: weekday, time: time)
      @lecture.course_id = @course.id

      respond_to do |format|
        if @lecture.save
          format.html { redirect_to course_lecture_path(@course, @lecture), notice: 'Lecture was successfully created.' }
          format.json { render :show, status: :created, location: course_lecture_path(@course, @lecture) }
        else
          format.html { render :new }
          format.json { render json: @lecture.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    if not user_signed_in? or not current_user.is_admin
      redirect_to course_lecture_path(@course, @lecture)
    else
      respond_to do |format|
        if @lecture.update(lecture_params)
          format.html { redirect_to course_lecture_path(@course, @lecture), notice: 'Lecture was successfully updated.' }
          format.json { render :show, status: :ok, location: course_lecture_path(@course, @lecture) }
        else
          format.html { render :edit }
          format.json { render json: @lecture.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    if not user_signed_in? or not current_user.is_admin
      redirect_to course_lecture_path(@course, @lecture)
    else
      @lecture.destroy
      respond_to do |format|
        format.html { redirect_to course_lectures_path(@course), notice: 'Lecture was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  $last_refresh = Time.now

  def refresh_messages
    $current_refresh = Time.now
    @message = Message.where(created_at: $last_refresh..$current_refresh, lecture: @lecture.id).where.not(user_id: current_user)
    $last_refresh = $current_refresh
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:day, :time)
    end
end
