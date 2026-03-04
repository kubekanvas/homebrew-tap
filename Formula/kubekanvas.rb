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
    sha256 "f1f4b0bc438b9c85d517721256e6ab2c295d101f7feae5436bedf874c5923eb9"
  end

  def install
    bin.install "kubekanvas"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
