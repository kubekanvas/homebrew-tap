class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "d8f9e701bc921504cb5113c4972648bb77a04dbe9c5ab09ec4f20e1c32fb1cb0"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
      sha256 "9d07a2ff59f09c692a1d9c35f34f1bcfb21914e0c15e07418ca70f45b5c60184"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "30e0e08289a9b5247761ce1d228be28963aec8d1764e27a9796ba049a05a3878"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/x64/homebrew/kubekanvas.tar.gz"
      sha256 "4616b0a25377369fde4b11cb3cc4fe0a8c98dc3f50b40999bf9d46fb8f34f08c"
    end
  end

  def install
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
