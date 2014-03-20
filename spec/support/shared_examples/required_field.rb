shared_examples_for "required_field" do |field|

  context "#{field} not set" do
    let(:invalid) { build(subject.class, :"#{field}" => nil) }

    it "fails validation" do
      expect(invalid.valid?).to be_false
    end
  end

end
