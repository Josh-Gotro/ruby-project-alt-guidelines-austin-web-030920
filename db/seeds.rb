online = [true, false]

austinZipcodes = [78610, 78613, 78617, 78641, 78652, 78653, 78660, 78664,
    78681, 78701, 78702, 78703, 78704, 78705, 78712, 78717, 78719, 78721, 78722, 78723, 78724,
    78725, 78726, 78727, 78728, 78729, 78730, 78731, 78732, 78733, 78734, 78735, 78736, 78737,
    78738, 78739, 78741, 78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752,
    78753, 78754, 78756, 78757, 78758, 78759]

50.times do
    Driver.create!(name: Faker::Internet.unique.free_email, online?: online.sample, zip_code: austinZipcodes.sample)
end

5.times do
    Passenger.create!(name: Faker::Internet.unique.free_email)
end

# 5.times do
#     Service.create!(referral_type: "Medical Care", primary_service: "Medical Care", location_name: "Hospital", zip_code: austinZipcodes.sample)
# end

# 5.times do
#     Service.create!(referral_type: "Food Security", primary_service: "Fresh food Distribution", location_name: "Food Bank", zip_code: austinZipcodes.sample)
# end

# 5.times do
#     Service.create!(referral_type: "Immunizations", primary_service: "Immunization clinics", location_name: "Hospital", zip_code: austinZipcodes.sample)
# end

url = "https://data.austintexas.gov/resource/9nwy-7ej8.json"

uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
records = JSON.parse(response.body)

records.each do |r|
    web_address = r["for_more_information"]["url"] if r["for_more_information"]
    Service.find_or_create(
        referral_type: r["referral_type"],
        primary_service: r["primary_service_to_community"],
        location_name: r["location_name"],
        zip_code: r["zip_code"],
        address: r["address_1"],
        web_address: web_address
        )
end