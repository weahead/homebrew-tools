class Wa < Formula
  desc "We aheads CLI"
  homepage "https://github.com/weahead/cli"
  url "https://github.com/weahead/cli.git", :tag => "v1.0.3", :revision => "c1a58b3cd063d6b5e83c6f49402c79681632fe05"
  head "https://github.com/weahead/cli.git", :branch => :master

  def install
    if head?
      inreplace "app/.version", /.*/, "#{version}"
    end
    libexec.install "app", "help", "utils", "wa"
    bin.install_symlink libexec/"wa"
    bash_completion.install "complete" => "wa"
  end

  test do
    system "wa", "version"
  end
end
