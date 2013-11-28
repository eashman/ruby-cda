require 'spec_helper'

describe Ccd do
  context ".build" do
    example do
      obs = Ccd::ProgressNote.new
      obs.should be
    end
  end

  context 'merge' do
    let(:converter) { Cda::Utility }
    context '.object_to_hash' do
      example do
        converter.object_to_hash([a: { b: 1 }]).should == { 0 => { a: { b: 1 } } }
        converter.object_to_hash(a: [ { b: 1 } ]).should == { a: { 0 => { b: 1 } } }
        converter.object_to_hash(a: [ { b: 1 }, 42 ]).should == { a: { 0 => { b: 1 }, 1 => 42 } }
      end

      example do
        hash = converter.object_to_hash([{a: 1}])
        hash[2].should == { a: 1 }
        hash['a'].should == nil
      end
    end

    context '.hash_to_object' do
      example do
        object = { a: [ { b: 1 }, 42] }
        converter.hash_to_object(converter.object_to_hash(object)).should == object
      end
    end

    context '.merge_json' do
      example do
        x = { a: [{ b: 1 }] }
        y = { a: [{ c: 3 }] }
        z = { a: [{ b: 1, c: 3}] }
        converter.merge_json(x,y).should == z
      end
    end
  end
end
