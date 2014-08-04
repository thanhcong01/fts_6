class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def edit
  end

  def show
    @subject = Subject.find params[:id]
  end
  
  def index
     @subjects = Subject.paginate page: params[:page], per_page: 5
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "create subject successfull! thanks you"
      redirect_to @subject
    else
      render 'new'
    end
  end

  private

    def subject_params
      params.require(:subject).permit(:context_display, :total_time, :count_question)
    end
end