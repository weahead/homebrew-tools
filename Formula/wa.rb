class Wa < Formula
  desc "We aheads CLI"
  homepage "https://github.com/weahead/cli"
  url "https://github.com/weahead/cli.git", :tag => "v1.2.3", :revision => "3020d6e9b27574fda05a15b8c828095e7741d36e"
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
