class Kubekanvas < Formula
  desc "KubeKanvas CLI - Manage your Kubernetes clusters visually"
  homepage "https://www.kubekanvas.io"
  version "68.0.0"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/homebrew/kubekanvas"
    sha256 "1005edc80eb3efe0d8a56e3a2def0ea59114a49703963b8b31d8e527c5261209"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/homebrew/kubekanvas"
    sha256 "19cb29971bafd8a1904b400a6f5a5bddab56230dd193502694cc53847ed5886f"
  end

  def install
    bin.install "kubekanvas"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
