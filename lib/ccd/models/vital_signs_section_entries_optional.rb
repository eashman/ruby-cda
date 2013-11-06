module Ccd
  class VitalSignsSectionEntriesOptional < ::Cda::Section
    include Virtus.model
    extend ::Ccd::Dsl
    #SHALL contain exactly one [1..1] templateId (CONF:7268) such that it
    constraint 'templateId', cardinality: '1..1'

    #SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.4" (CONF:10451).
    constraint 'templateId.root', cardinality: '1..1', value: '2.16.840.1.113883.10.20.22.2.4'

    #SHALL contain exactly one [1..1] code (CONF:15242).
    constraint 'code', cardinality: '1..1'

    #This code SHALL contain exactly one [1..1] @code="8716-3" Vital Signs (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:15243).
    constraint 'code.code', cardinality: '1..1', value: '8716-3'

    #SHALL contain exactly one [1..1] title (CONF:9966).
    constraint 'title', cardinality: '1..1'

    #SHALL contain exactly one [1..1] text (CONF:7270).
    constraint 'text', cardinality: '1..1'

    #SHOULD contain zero or more [0..*] entry (CONF:7271) such that it
    constraint 'entry', cardinality: '0..*'

    #SHALL contain exactly one [1..1] Vital Signs Organizer (templateId:2.16.840.1.113883.10.20.22.4.26) (CONF:15517).
    constraint 'entry.organizer', cardinality: '1..1'

    Ccd.load_extension('vital_signs_section_entries_optional.rb')
  end
end
