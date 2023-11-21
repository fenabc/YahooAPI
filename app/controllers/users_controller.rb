require 'net/http'
require 'nokogiri'
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

    #リクエスト送信
    url = URI.parse("https://map.yahooapis.jp/geoapi/V1/reverseGeoCoder")
    url.query = [
      "lat=" + "35.68381981",
      "lon=" + "139.77456498",
      "appid=" + "dj00aiZpPTBlMlZsNXRFck5nOSZzPWNvbnN1bWVyc2VjcmV0Jng9YjI-"
    ].join("&")

    req = Net::HTTP::Get.new(url.request_uri)

    ret = Net::HTTP::start(url.host, url.port, use_ssl: true) do |http|
      http.request(req)
    end

    
    
    #nokogiri::xml::document生成
    xml = Nokogiri::XML(ret.body)
    #名前空間の定義
    namespace = {
      "YDF" => "http://olp.yahooapis.jp/ydf/1.0"
    }
    ydf = xml.xpath('//YDF:Property', namespace)
    p result = ydf.xpath("YDF:AddressElement/YDF:Name", namespace).text

    

    # binding.pry
  end

  def create
    @user = User.new(get_user)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity #statusはrails7のみ
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(get_user)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def find
    @users = User.where("name like ? or email like ?", "%#{params[:text]}%", "%#{params[:text]}%").limit(10)
    render :index
  end

  private
  def get_user
    params.require(:user).permit(:name, :email)
  end
end
