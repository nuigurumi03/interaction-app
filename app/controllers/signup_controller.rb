class SignupController < ApplicationController
  before_action :redirect_to_index_from_sms,only: :sms_authentication
  before_action :redirect_to_index_from_address,only: :address

  def index
  end

  def registration
    @user = User.new
    @profile = Profile.new
  end

  def first_validation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthyear] = profile_params[:birthyear]
    session[:birthmonth] = profile_params[:birthmonth]
    session[:birthday] = profile_params[:birthday]
    session[:family_name] = profile_params[:family_name]
    session[:personal_name] = profile_params[:personal_name]
    session[:family_name_kana] = profile_params[:family_name_kana]
    session[:personal_name_kana] = profile_params[:personal_name_kana]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      prefecture: '沖縄',
      city: '那覇市',
      postal_code: '888-8888',
      tel: '090-1234-5678',
      house_code: '99',
      bulid_name: '首里城'
    )
    check_user_valid = @user.valid?
    check_profile_valid = @profile.valid?
    unless check_user_valid && check_profile_valid
      render 'signup/registration'
    else
      session[:through_first_valid] = "through_first_valid"
      redirect_to sms_authentication_signup_index_path
    end
  end

  def sms_authentication
    @profile = Profile.new
  end

  def sms_check
    session[:tel] = profile_params[:tel]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      prefecture: '沖縄',
      city: '那覇市',
      postal_code: '888-8888',
      tel: session[:tel],
      house_code: '99',
      bulid_name: '首里城'
    )
    check_user_valid = @user.valid?
    check_profile_valid = @profile.valid?
    unless check_user_valid && check_profile_valid
      render 'signup/sms_authentication'
    else
      session[:through_sms_check] = "through_sms_check"
      redirect_to address_signup_index_path
    end
  end

  def address
    @profile = Profile.new
  end

  def second_validation
    session[:postal_code] = profile_params[:postal_code]
    session[:prefecture] = profile_params[:prefecture]
    session[:city] = profile_params[:city]
    session[:house_code] = profile_params[:house_code]
    session[:bulid_name] = profile_params[:bulid_name]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @user.save

    @profile = Profile.new(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      prefecture: session[:prefecture],
      city: session[:city],
      postal_code: session[:postal_code],
      tel: session[:tel],
      house_code: session[:house_code],
      bulid_name: session[:bulid_name]
    )
    if @profile.save
      reset_session
      session[:id] = @user.id
      redirect_to done_signup_index_path
      return 
    else
      reset_session
      render :address
    end
end
    # check_profile_valid = @profile.valid?
    # unless check_user_valid && check_profile_valid
    #   render 'signup/address'
    # else
    #   session[:through_second_validation] = "through_second_validation"
    #   redirect_to action:create
    # end
  # end

  # def create
  #   @user = User.new(nickname: session[:nickname],email: session[:email],password: session[:password],password_confirmation: session[:password_confirmation])
  #   # 万一ユーザーがcreateできなかった場合、全sessionをリセットして登録ページトップへリダイレクト
  #   unless @user.save
  #     reset_session
  #     redirect_to signup_index_path
  #     return
  #   end
  #   # userが作れたらuserに紐づけてprofileを作ります
  #   @profile = Profile.create(
  #     user: @user,
  #     birthyear: session[:birthyear],
  #     birthmonth: session[:birthmonth],
  #     birthday: session[:birthday],
  #     family_name: session[:family_name],
  #     personal_name: session[:personal_name],
  #     family_name_kana: session[:family_name_kana],
  #     personal_name_kana: session[:personal_name_kana],
  #     prefecture: session[:prefecture],
  #     city: session[:city],
  #     postal_code: session[:postal_code],
  #     tel: session[:tel],
  #     house_code: session[:house_code],
  #     bulid_name: session[:bulid_name]
  #   )
  #   # 最後のフォームでクレジット認証を行なっているため、ここでカードの顧客情報を作り、userと紐づけてDBに保存する処理を行なっています
  #   # customer = Payjp::Customer.create(card: params[:payjp_token])
  #   # @creditcard = Creditcard.new(user: @user,customer_id: customer.id,card_id: customer.default_card)
  #   # カード情報まで保存に成功したら全sessionをリセットしてユーザーidのみsessionに預け、完了画面へリダイレクト
  #   if @user.save
  #     reset_session
  #     session[:id] = @user.id
  #     redirect_to done_signup_index_path
  #     return
  #   else
  #     #失敗したらsessionを切って登録ページトップへリダイレクト
  #     reset_session
  #     redirect_to signup_index_path
  #   end
  # end

  def done
    # session[id]がなければ登録ページトップへリダイレクト
    unless session[:id]
      redirect_to signup_index_path 
      return
    end
    # deviseのメソッドを使ってログイン
    sign_in User.find(session[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:birthyear,:birthmonth,:birthday,:family_name,:personal_name,:family_name_kana,:personal_name_kana,:postal_code,:prefecture,:city,:tel,:house_code,:bulid_name)
  end

  def redirect_to_index_from_sms
    redirect_to signup_index_path unless session[:through_first_valid].present? && session[:through_first_valid] == "through_first_valid"
  end

  def redirect_to_index_from_address
    redirect_to signup_index_path unless session[:through_sms_check].present? && session[:through_sms_check] == "through_sms_check"
  end

end