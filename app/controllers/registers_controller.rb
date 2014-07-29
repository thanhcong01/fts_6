class RegistersController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  def new
    @register = Register.new
    @subjects = Subject.all
    @categories = Category.all
    params[:category_id] = Category.first.id if Category.first
    @registers = current_user.registers.order("created_at DESC")
  end

  def create
    unless params[:register][:subject_id].nil? && params[:register][:category_id].nil?
      params[:register][:subject_id].each do |id|
        @register = Register.new register_params
        @register.finish = false
        @register.mark = 0
        @register.user_id = current_user.id
        @register.subject_id = id
        @register.count_correct = 0;
        @register.date_test = Time.now
        @register.start = false
        unless @register.save
          flash.now[:error] = "Sorry, error! please try again."
        end
      end
    end
    redirect_to new_register_path
  end

  def edit

  end

  def show
  end

  def index
  end

  private

    def register_params
      params.require(:register).permit(:category_id)
    end
end
