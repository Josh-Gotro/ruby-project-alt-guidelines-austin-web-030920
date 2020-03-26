online = [true, false]


austinZipcodes = [Service.all_zips]

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





