require 'spec_helper'

describe Cda::Utility do
  subject { described_class }

  describe 'inference' do
    example do
      path = 'record_target.patient_role.provider_organization.id.root'.split '.'
      given = subject.inference(path, '42', Cda::ClinicalDocument)
      expected = {record_target: [{patient_role: {provider_organization: {id: [{root: '42'}]}}}]}
      given.should == expected.with_indifferent_access
    end

    example do
      subject.inference(['realm_code'], 'US', Cda::ClinicalDocument).should == {'realm_code' => ['US']}
    end
  end
end