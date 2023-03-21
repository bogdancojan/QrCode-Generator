class Apis::V1::QrCodeController < ApplicationController
  def generate
    qr_code = RQRCode::QRCode.new(qr_code_param[:url].to_s)
    png = qr_code.as_png(size: 300)
    base64_png = Base64.encode64(png.to_s)
    render json: { qr_code: base64_png }
  end

  def download
    qr_code = RQRCode::QRCode.new(params[:url].to_s)
    png = qr_code.as_png(size: 300)
    send_data png.to_s, type: 'image/png', disposition: 'attachment', filename: 'qrcode.png'
  end

  private
  def qr_code_param
    params.require(:qr_code).permit(:url)
  end
end
