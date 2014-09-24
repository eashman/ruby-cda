require 'spec_helper'
require 'support/vidaguard_entities'

describe Cda::XmlParser do
  include Cda::VidaguardEntities

  let(:xml_content) {
    filename = File
      .join(File.dirname(__FILE__), '..', 'fixtures', "vidaguard.xml")
    File.read(filename)
  }

  let(:root_node) do
    document = Nokogiri::XML.parse(xml_content)
    document.remove_namespaces!
    document.xpath('ClinicalDocument')
  end

  subject { described_class.new(root_node, registry) }

  it 'should parse document' do
    instance = subject.parse
    instance.template_id.first.root.should == "2.16.840.1.113883.10.20.22.1.1"
    instance.title.should == 'Community Health and Hospitals: Health Summary'
  end
end
