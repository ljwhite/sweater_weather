FactoryBot.define do
  factory :forecast do
    {:current_forecast=>
       {:current_temp=>59,
        :feels_like=>54,
        :humidity=>18,
        :uv_index=>6.76,
        :current_description=>"Broken Clouds",
        :sunrise=>1600605971,
        :sunset=>1600650010,
        :time=>'2020-09-20 14:27:14 -0600',
        :high=>60,
        :low=>51},
      :hourly_forecast=>
       {"hour_0"=>{:temp=>59, :desciption=>"Clouds", :time=>"2 PM"},
        "hour_1"=>{:temp=>60, :desciption=>"Clouds", :time=>"3 PM"},
        "hour_2"=>{:temp=>60, :desciption=>"Clouds", :time=>"4 PM"},
        "hour_3"=>{:temp=>61, :desciption=>"Clouds", :time=>"5 PM"},
        "hour_4"=>{:temp=>60, :desciption=>"Clouds", :time=>"6 PM"},
        "hour_5"=>{:temp=>59, :desciption=>"Clouds", :time=>"7 PM"},
        "hour_6"=>{:temp=>59, :desciption=>"Clouds", :time=>"8 PM"},
        "hour_7"=>{:temp=>58, :desciption=>"Clouds", :time=>"9 PM"}},
      :daily_forecast=>
       {:day_1=>{:day=>"Monday", :high=>62, :low=>51, :description=>"Rain", :rainfall=>0.44, :snowfall=>nil},
        :day_2=>{:day=>"Tuesday", :high=>59, :low=>51, :description=>"Rain", :rainfall=>3.81, :snowfall=>nil},
        :day_3=>{:day=>"Wednesday", :high=>61, :low=>50, :description=>"Clouds", :rainfall=>nil, :snowfall=>nil},
        :day_4=>{:day=>"Thursday", :high=>63, :low=>51, :description=>"Clouds", :rainfall=>nil, :snowfall=>nil},
        :day_5=>{:day=>"Friday", :high=>64, :low=>52, :description=>"Clear", :rainfall=>nil, :snowfall=>nil}}}
  end
end
