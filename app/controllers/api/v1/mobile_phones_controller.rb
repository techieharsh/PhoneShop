class Api::V1::MobilePhonesController < Api::V1::ApiController
  before_action :authenticate_user!

  def index
    mobile_phones = MobilePhone.paginate(page: params[:page], per_page: 3)
    authorize mobile_phones
    render json: { mobile_phones: mobile_phones, count: mobile_phones.count }
  end

  def create
    mobile_phone = MobilePhone.new(mobile_phone_params)
    authorize mobile_phone

    if mobile_phone.save
      render json: mobile_phone
    else
      render json: mobile_phone.errors.full_messages
    end
  end

  private

    def mobile_phone_params
      params.require(:mobile_phone).permit(:manufacturer, :model, :model_number, :storage_capacity,
                    :manufacturing_year, :color, :price)
    end
end
