class Kubekanvas < Formula
  desc "KubeKanvas CLI"
  homepage "https://www.kubekanvas.io"
  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/1c3d9d5/kubekanvas", :using => :curl
    sha256 "3495af422fd8565e56a856f7faa9d89b84c0eb89ddce198de0da1708a761cc11"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/1c3d9d5/kubekanvas-dmg", :using => :curl
    sha256 "1d32400c414fb2415d6635dfceb9e5a9c7bd6151dbd3886d0289f55790cf7954"
  end
  version "1.0.1"

  def install
  downloaded = Dir["*"].find { |f| f.include?("kubekanvas") }
  bin.install downloaded => "kubekanvas"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
