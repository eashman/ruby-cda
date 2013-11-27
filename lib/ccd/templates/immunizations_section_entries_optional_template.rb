module Ccd::ImmunizationsSectionEntriesOptionalTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7965) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.2" (CONF:10399).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.2"}
      
      # SHALL contain exactly one [1..1] code (CONF:15367).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"11369-6", :display_name=>"Immunizations", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:7967).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7968).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end
