shared_examples_for "favourable" do
  specify { expect(subject).to respond_to(:favourites) }

  it "can add a favourite" do
    subject.favourites << build(:favourite)
    expect(subject.favourites.length).to eq(1)
  end
end