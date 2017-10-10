class Wa < Formula
  desc "We aheads CLI"
  homepage "https://github.com/weahead/cli"
  url "https://github.com/weahead/cli.git", :tag => "v1.0.5", :revision => "93fb0f42081c5e98267dcd8d02e8483145096360"
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
