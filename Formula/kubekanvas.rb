class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.2.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "ec2e47152c7fd368611e846a3c971594e9360db8eca4533c897a1bfbc4a2a15a"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
      sha256 "f2438951d388c8182911d1f6fbe5f53e33bf50c3de2828b2eef1a25b9dce2dad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "85e37c311ea71a5f09d305ddf91a260a1bf2ea2d7355659d869a5fd82877e007"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/x64/homebrew/kubekanvas.tar.gz"
      sha256 "a779148d478edb9154da4500a4cd48e5738a7abdfcc0acc11bc338cbfd5391be"
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
