class Wa < Formula
  desc "We aheads CLI"
  homepage "https://github.com/weahead/cli"
  url "https://github.com/weahead/cli.git", :tag => "v1.0.8", :revision => "ca199566da85edb503470d8ae6f02a90b126a7ec"
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
