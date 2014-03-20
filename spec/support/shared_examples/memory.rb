shared_examples_for "memory" do
  it_behaves_like "commentable"
  it_behaves_like "favourable"

  specify { expect(subject).to respond_to(:hosted_externally?) }
  specify { expect(subject).to respond_to(:uploaded) }
  specify { expect(subject).to respond_to(:filename) }
  specify { expect(subject).to respond_to(:filename=) }
  specify { expect(subject).to respond_to(:file_path) }

  describe "#hosted_externally?" do
    context "when file has been uploaded" do
      let(:uploaded) { subject.class.new(filename: subject.filename, uploaded: true) }
      it { expect(uploaded.hosted_externally?).to be_false }
    end

    context "when file has not been uploaded" do
      let(:external) { subject.class.new(filename: subject.filename, uploaded: false) }
      it { expect(external.hosted_externally?).to be_true }
    end
  end

  describe "#file_path" do
    it "creates a relative path to the file in the assets folder" do
      expect(subject.file_path).to eq(
        "/memories/#{subject.class.name.underscore}/#{subject.filename}"
      )
    end
  end

end