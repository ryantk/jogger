shared_examples_for "commentable" do
  specify { expect(subject).to respond_to(:comments) }

  it "can add a comment" do
    starting_comment_count = subject.comments.length
    subject.comments << build(:comment)
    expect(subject.comments.length).to eq(starting_comment_count + 1)
  end
end