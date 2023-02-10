require 'geocoder/results/base'

module Geocoder::Result
  class AmazonLocationService < Base
    def initialize(result)
      @place = result
    end

    def coordinates
      [@place.geometry.point[1], @place.geometry.point[0]]
    end

    def address
      @place.label
    end

    def neighborhood
      @place.neighborhood
    end

    def route
      @place.street
    end

    def city
      @place.municipality || @place.sub_region
    end

    def state
      if @place.region
        states_lookup.key(@place.region)&.to_s
      end
    end

    def state_code
      if @place.region
        states_lookup.key(@place.region)&.to_s
      end
    end

    def province
      @place.region
    end

    def province_code
      @place.region
    end

    def postal_code
      @place.postal_code
    end

    def country
      @place.country
    end

    def country_code
      @place.country
    end

    def street_number
      @place.address_number
    end

    def street_address
      [street_number, route].compact.join(' ')
    end

    def formatted_address
      address
    end

    def states_lookup
      {  AK: "Alaska",
        AL: "Alabama",
        AR: "Arkansas",
        AS: "American Samoa",
        AZ: "Arizona",
        CA: "California",
        CO: "Colorado",
        CT: "Connecticut",
        DC: "District of Columbia",
        DE: "Delaware",
        FL: "Florida",
        GA: "Georgia",
        GU: "Guam",
        HI: "Hawaii",
        IA: "Iowa",
        ID: "Idaho",
        IL: "Illinois",
        IN: "Indiana",
        KS: "Kansas",
        KY: "Kentucky",
        LA: "Louisiana",
        MA: "Massachusetts",
        MD: "Maryland",
        ME: "Maine",
        MI: "Michigan",
        MN: "Minnesota",
        MO: "Missouri",
        MS: "Mississippi",
        MT: "Montana",
        NC: "North Carolina",
        ND: "North Dakota",
        NE: "Nebraska",
        NH: "New Hampshire",
        NJ: "New Jersey",
        NM: "New Mexico",
        NV: "Nevada",
        NY: "New York",
        OH: "Ohio",
        OK: "Oklahoma",
        OR: "Oregon",
        PA: "Pennsylvania",
        PR: "Puerto Rico",
        RI: "Rhode Island",
        SC: "South Carolina",
        SD: "South Dakota",
        TN: "Tennessee",
        TX: "Texas",
        UT: "Utah",
        VA: "Virginia",
        VI: "Virgin Islands",
        VT: "Vermont",
        WA: "Washington",
        WI: "Wisconsin",
        WV: "West Virginia",
        WY: "Wyoming"
      }
    end
  end
end
