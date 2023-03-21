Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :apis do
    namespace :v1 do
      post 'qrcode/generate', to: 'qr_code#generate'
      get  'qrcode/download', to: 'qr_code#download'
    end
  end
end
