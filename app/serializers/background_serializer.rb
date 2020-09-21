class BackgroundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location, :url, :credits
end
