class Kubekanvas < Formula
  desc "KubeKanvas CLI"
  homepage "https://www.kubekanvas.io"
  url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/9349862/kubekanvas", :using => :curl
  sha256 "9555835556b9bd9961df1924b1337b951a7846d4dfc3861723fcde219035ab06"
  version "1.0.0"

  def install
    puts Dir["*"]
    bin.install "kubekanvas"
    prefix.install "../LICENSE"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
