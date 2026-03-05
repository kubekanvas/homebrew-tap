class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "69.0.0"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
    sha256 "7585a96775b16a802c6c084393685d6df442dd625797f0aafb89a1281bcc2c77"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
    sha256 "c4e719df320f90cdda8c7a1f639379cb678333859271f68ade17f0cbcca5340c"
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
