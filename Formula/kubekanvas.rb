class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.1.1"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
    sha256 "45f8b880da939814f7bd80481ed94c5add30529595a07006861a39d184685bf0"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
    sha256 "c7307c64139602a5bf6bff0db22f890bf63f266b2e939b6524e909468e72280c"
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
