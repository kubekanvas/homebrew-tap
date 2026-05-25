class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "d65fab7200aa884f553756cf4704a9c19114ea61a7ec6227151164e08c329062"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas.tar.gz"
      sha256 "369d7ab0044bc6392705a126dec0cf4c6a929447fd6689614423dc8d40ead27f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/arm64/homebrew/kubekanvas.tar.gz"
      sha256 "444698e92bcb6a8badf18a120e60da836a5886002912213ac336189d02943c71"
    else
      url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/linux/x64/homebrew/kubekanvas.tar.gz"
      sha256 "72a97ef844403b0638a049aee2efbd5b40340c4d1ac70e9aca40d2c15f3fc529"
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
