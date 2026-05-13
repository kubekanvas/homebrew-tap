class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "9eecf3576b213a5ce37a8da433e479678333f919536ed592764237b29e6a8c1f"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
      sha256 "6d74c090235603d205732a31c00a1b6d0bc240e2ebcf05fcd6c441ba37e81c70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "016fdc3a017511596648fb7ef616f674d35b8ee45b62452f36475d9d35305bec"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/x64/homebrew/kubekanvas.tar.gz"
      sha256 "800e516473f25b5269bb44ae264b4286e7ec3cb148efe2f7774fe593fa80d8a2"
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
