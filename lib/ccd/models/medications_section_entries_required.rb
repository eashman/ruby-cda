module Ccd
  class MedicationsSectionEntriesRequired < ::Cda::Section
    include Virtus.model
    extend ::Ccd::Dsl
    #SHALL contain exactly one [1..1] templateId (CONF:7568) such that it
    constraint 'template_id', cardinality: '1..1'

    #SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.1.1" (CONF:10433).
    constraint 'template_id.root', cardinality: '1..1', value: '2.16.840.1.113883.10.20.22.2.1.1'

    #SHALL contain exactly one [1..1] code (CONF:15387).
    constraint 'code', cardinality: '1..1'

    #This code SHALL contain exactly one [1..1] @code="10160-0" History of medication use (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:15388).
    constraint 'code.code', cardinality: '1..1', value: '10160-0'

    #SHALL contain exactly one [1..1] title (CONF:7570).
    constraint 'title', cardinality: '1..1'

    #SHALL contain exactly one [1..1] text (CONF:7571).
    constraint 'text', cardinality: '1..1'

    #SHALL contain at least one [1..*] entry (CONF:7572) such that it
    constraint 'entry', cardinality: '1..*'

    #SHALL contain exactly one [1..1] Medication Activity (templateId:2.16.840.1.113883.10.20.22.4.16) (CONF:15500).
    constraint 'entry.substance_administration', cardinality: '1..1'

    #If medication use is unknown, the appropriate nullFlavor MAY be present (see unknown information in Section 1)
    constraint 'entry.null_flavor', cardinality: '0..1'

    Ccd.load_extension('medications_section_entries_required.rb')
  end
end