module Ccd
  class USRealmDateAndTimeDTUSFIELDEDDE < Cda::IVL_TS
    extend ::Ccd::Dsl

    # 	SHALL be precise to the day
    constraint '', {:cardinality=>"1..1"}

    def self.template_type
      "IVL_TS"
    end

    Ccd.load_extension('us_realm_date_and_time_dtusfieldedde.rb')
  end
end
