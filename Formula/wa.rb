class Wa < Formula
  desc "We aheads CLI"
  homepage "https://github.com/weahead/cli"
  url "https://github.com/weahead/cli.git", :tag => "v1.1.1", :revision => "e3ce1433d3b4ccd01e9d83272504d1779950b817"
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
