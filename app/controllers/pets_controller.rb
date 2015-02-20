class PetsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pets = Pet.all

    @markers = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
      marker.title pet.name
      marker.infowindow pet.description
      # marker.picture({
      #   url: "http://www.jyrousseau.com/imag290.gif",
      #   width: 32,
      #   height: 32,
      #   })
    end
  end

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
      # marker.picture({
      #   url: "https://s3-eu-west-1.amazonaws.com/rock-my-pet-pix/paw.svg?X-Amz-Date=20150219T191700Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=f7881bfe71725aff503791e2cb45544eb3ca84f03ea9f0041eae8dcd48401a8e&X-Amz-Credential=ASIAI2WX645KAWVOZB5Q/20150219/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEFsakAKZmX3EJIVcxYy4rL5qGU%2BdJDj8WtTpnghveNZ5lYEmDjc%2B3K/F47B/xb3NFB4t/MBzv5/bNNzw0ZiVTkj32g77mRH6WWS5OMfSo/X8lzq4GIYUor5eQg7OcmMwte3kqa6TAPFjje7f08s2K7XOOEUgpJ1AvsokpyA7Uqaoh3Hgge4Vg1afPs%2BxWa0N24qqKRGXJKRdfkkgMVw5URQrMVncTP1N3nxRtXdLqnSq5gDW5jTToGWVDOVkMFLRUCo8B2ZNrNPtCuSO9C6yF3qO9CowxQTyQgEE/mpChW2qyFNC5TnRYwlN1Nq5hISzM9Wn40UOflhIY9oW7Oi6RVy%2Bjtuc/5/ji%2BG0ckmfAjGwqhiEAyC76ZanBQ%3D%3D",
      #   width: 32,
      #   height: 32,
      #   })
    end
  end
end
