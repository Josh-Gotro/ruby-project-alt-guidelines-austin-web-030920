class Service < ActiveRecord::Base
    has_many :visits
    has_many :passengers, through: :visits

    def self.create_api_link
        url = "https://data.austintexas.gov/resource/9nwy-7ej8.json"

        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        records = JSON.parse(response.body)
    end

    def self.seed_data
        create_api_link.each do |r|
            web_address = r["for_more_information"]["url"] if r["for_more_information"]
            Service.find_or_create_by(
                referral_type: r["referral_type"],
                primary_service: r["primary_service_to_community"],
                location_name: r["location_name"],
                zip_code: r["zip_code"],
                address: r["address_1"],
                web_address: web_address
                )
        end
    end

    def self.view_services_by(service_type)
        self.where("referral_type = service_type")
    end
end

