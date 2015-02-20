class PetsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pets = Pet.all

    @markers = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
      marker.title pet.name
      marker.infowindow pet.description
      marker.picture({
        url: 'https://s3-eu-west-1.amazonaws.com/rock-my-pet-pix/paw.svg?X-Amz-Date=20150220T112444Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=ed12c2cfede8f98ad3bcfd231c6c808955c8f3da5ea8dd52f0180beac63a4690&X-Amz-Credential=ASIAJL37ZWUWXJXZFZ2Q/20150220/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEHMakAIc443w7SHNGAO113WIqm9t2wgwYeKwh2MaLXAfdhH2mIxFXS7DtfPiZWdI0tA/Y%2BDGF9p2a%2Bbe3oGNEQxXgWNPVpM/RfPYgT4zNcrXAgML0wk%2BME88qaZ/1T%2BwdcV9m53fWT38%2B%2BKVvIxOj2Fyp/gKIIC7Y9dPx6UQwJQPZh%2BJimVvU1Ubcccp51/OtwQDJx26kJHCJvNPeLzuv5GVNp%2BQtZt%2Blw2TjP82aoCKnBVGjn5XazpC6R/jHKLHDaaAA%2Bxmz/w%2ByYpXt3229Uw0Sb2nsb/RBWkvjtpq%2BGCsMcIJdtMuVxbVSOOS5fokww2YhS81KvnlYDzyjZQp8b7ppgKuHy6aKo6Q0cGEBRV2F6UlVCCKkpynBQ%3D%3D',
        width: 32,
        height: 32,
        })
    end
  end

  #"https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    @pet_coordinates = { latitude: @pet.latitude, longitude: @pet.longitude}

    @marker = Gmaps4rails.build_markers(@pet) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
      marker.title pet.name
      marker.title pet.name
      marker.infowindow pet.description
      marker.picture({
        url: 'https://s3-eu-west-1.amazonaws.com/rock-my-pet-pix/paw.svg?X-Amz-Date=20150220T112444Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=ed12c2cfede8f98ad3bcfd231c6c808955c8f3da5ea8dd52f0180beac63a4690&X-Amz-Credential=ASIAJL37ZWUWXJXZFZ2Q/20150220/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEHMakAIc443w7SHNGAO113WIqm9t2wgwYeKwh2MaLXAfdhH2mIxFXS7DtfPiZWdI0tA/Y%2BDGF9p2a%2Bbe3oGNEQxXgWNPVpM/RfPYgT4zNcrXAgML0wk%2BME88qaZ/1T%2BwdcV9m53fWT38%2B%2BKVvIxOj2Fyp/gKIIC7Y9dPx6UQwJQPZh%2BJimVvU1Ubcccp51/OtwQDJx26kJHCJvNPeLzuv5GVNp%2BQtZt%2Blw2TjP82aoCKnBVGjn5XazpC6R/jHKLHDaaAA%2Bxmz/w%2ByYpXt3229Uw0Sb2nsb/RBWkvjtpq%2BGCsMcIJdtMuVxbVSOOS5fokww2YhS81KvnlYDzyjZQp8b7ppgKuHy6aKo6Q0cGEBRV2F6UlVCCKkpynBQ%3D%3D',
        width: 32,
        height: 32,
        })
    end
  end

  def search
    @pets = Pet.near(params[:search], 50)
  end
end
