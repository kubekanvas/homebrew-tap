class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.1.0"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
    sha256 "9fd7818ff872ddf08b11b480532b9a33c39bfcc189161e11a3593694d62808f8"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
    sha256 "213caf1529964bfdc9b1e65a1476daf8c90f9baead79c5f80e976f66e872cc99"
  end

  def install
    # Handle both tar.gz extraction (file named "kubekanvas") and raw binary downloads
    # (Homebrew names raw downloads after the URL host, not the binary name)
    if File.exist?("kubekanvas")
      bin.install "kubekanvas"
    else
      bin.install Dir.glob("*").first => "kubekanvas"
    end
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
