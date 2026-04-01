class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.6.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "c0f89e2d1106eb494bd66ff3ae6695cf82ae58aaa8c8fd3962a69d9ac20f4e6d"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
      sha256 "d54cbe3f0e4ee022b5266f428c637028347314c95272b013620075c23d54aa66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "d43ab09a89d47177a1fc7475756c196e3d174790db3824d3395b760bb33fabea"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/x64/homebrew/kubekanvas.tar.gz"
      sha256 "acc57b36d97efae1a20a8b487b0ea6e0801d48b6404eabc62172ee5f6fda4e33"
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
