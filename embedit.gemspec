Gem::Specification.new do |s|
  s.name = %q{embedit}
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Red Davis", "Michael Bumann"]
  s.date = %q{2008-09-28}
  s.email = %q{michael@railslove.com}
  s.files = ["lib/embedit/exceptions.rb", "lib/embedit/media.rb", "lib/embedit/provider.rb", "lib/embedit/providers/flv.rb", "lib/embedit/providers/google_video.rb", "lib/embedit/providers/image.rb", "lib/embedit/providers/ipernity.rb", "lib/embedit/providers/oembed.rb", "lib/embedit/providers/ovi.rb", "lib/embedit/providers/sevenload_video.rb", "lib/embedit/providers/youtube.rb", "lib/embedit/validate.rb", "lib/embedit.rb", "README", "spec/google_video_spec.rb", "spec/oembed_spec.rb", "spec/ovi_spec.rb", "spec/player_spec.rb", "spec/youtube_spec.rb"]
  s.homepage = %q{http://github.com/bumi/embedit}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Ruby interface for embedding a range of media.}
  s.test_files = ["spec/google_video_spec.rb", "spec/oembed_spec.rb", "spec/ovi_spec.rb", "spec/player_spec.rb", "spec/youtube_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
