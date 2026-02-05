class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "1.0.0"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/latest/kubekanvas"
    sha256 "d5daa8c58dc2c30c6096274eecedcd1ba60b68e8c13dee8bbaab8f24b846fafd"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/latest/kubekanvas"
    sha256 "8b04868ed9a9847e8c8127f10e6dad48a2da8f3710804f9c71b65a3b4c05c719"
  end

  def install
    bin.install "kubekanvas"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
