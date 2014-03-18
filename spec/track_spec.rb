describe WiMP::Track, vcr: {record: :new_episodes} do
  before(:each) do
    WiMP.configure do |config|
      config.username = "uuaa@reallymymail.com"
      config.password = "qdgfbb"
    end
  end

  it "should be searchable" do
    tracks = WiMP::Track.search("madonna hung up")
    tracks.should_not be_empty
    tracks.each do |track|
      track.id.should be_a(Integer)
      track.stream_started_at.should be_a(Date)
      track.sales_started_at.should be_a(Date)
      track.artist.should be_a(String)
      track.artist_id.should be_a(Integer)
      track.url.should match(%r{http://wimpmusic.se/track/\d+})
    end
  end

  it "should paginate" do
    WiMP::Track.search("madonna hung up", limit: 1).count.should eq(1)
  end
end