shared_examples_for "commentable" do
  specify { expect(subject).to respond_to(:comments) }

  it "can add a comment" do
    subject.comments << build(:comment)
    expect(subject.comments.length).to eq(1)
  end
end