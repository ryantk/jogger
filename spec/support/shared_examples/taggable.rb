shared_examples_for "taggable" do
  specify { expect(subject).to respond_to(:tags) }
  specify { expect(subject.class).to respond_to(:find_by_tag) }

  it "can add tags" do
    subject.tags << build(:tag)
    expect(subject.tags.length).to be(1)
  end

  describe "#find_by_tag" do
    it "finds correct entries" do
      a_taggable = create(subject.class, tags: [
        create(:tag, title: "x"),
        create(:tag, title: "y"),
        create(:tag, title: "z")
      ])
      expect(subject.class.find_by_tag("x")).to include(a_taggable)
    end
  end
end