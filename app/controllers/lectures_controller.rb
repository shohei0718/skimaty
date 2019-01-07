class LecturesController < ApplicationController
  def index
    @lectures = Lecture.includes(:user).limit(8).order("created_at DESC")
  end

  def show
    @lecture = Lecture.find(params[:id])
    @user = @lecture.user
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.create(lecture_params)
    # binding.pry
    redirect_to action: :index
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.user_id == current_user.id
      @lecture.update(lecture_params)
    end
    redirect_to user_path(current_user[:id])
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    if @lecture.user_id == current_user.id
      @lecture.destroy
    end
    redirect_to user_path(current_user[:id])
  end

    Payjp::api_key ='sk_test_c5be69e2d1ccf9815f894a2d'

  def self.create_token(number, cvc, exp_year, exp_month)
  token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  def pay
    Payjp.api_key = 'sk_test_c5be69e2d1ccf9815f894a2d'
    @user = current_user
    @lecture = Lecture.find(params[:id])
    # @lecture.update_attribute(:order_status_id, 2 )

    if customer_id = @user.customer_id
      customer = Payjp::Customer.retrieve(id: customer_id)

      charge = Payjp::Charge.create(
        amount: params['price'],
        customer: customer,
        currency: 'jpy',
      )
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @user.customer_id = customer.id
      @user.save

      charge = Payjp::Charge.create(
        amount: params['price'],
        customer: customer,
        currency: 'jpy',
      )
    end
    redirect_to root_path
  end

  private

  def lecture_params
    params.require(:lecture).permit(:title, :sumary, :note, :image, :price, :attempt, :genre_id).merge(user_id: current_user.id)
  end
end
