module Ccd::ResultsSectionEntriesOptionalTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7116) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.3" (CONF:9136).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.3"}
      
      # SHALL contain exactly one [1..1] code (CONF:15431).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"30954-2", :display_name=>"Relevant diagnostic tests and/or laboratory data", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:8891).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7118).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end
