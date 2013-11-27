module Ccd::EncountersSectionEntriesOptionalTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7940) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.22" (CONF:10386).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.22"}
      
      # SHALL contain exactly one [1..1] code (CONF:15461).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"46240-8", :display_name=>"Encounters", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:7942).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7943).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end
