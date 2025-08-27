class Kubekanvas < Formula
  desc "KubeKanvas CLI"
  homepage "https://www.kubekanvas.io"
  if Hardware::CPU.arm?
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/arm64/9349862/kubekanvas", :using => :curl
    sha256 "c02a99918277ebde0e2d86136360cb40f5fc5e82383c7182b73592efb980bc66"
  else
    url "https://s3.us-east-1.amazonaws.com/downloads.kubekanvas.io/macos/x64/9349862/kubekanvas", :using => :curl
    sha256 "9555835556b9bd9961df1924b1337b951a7846d4dfc3861723fcde219035ab06"
  end
  version "1.0.0"

  def install
  downloaded = Dir["*"].find { |f| f.include?("kubekanvas") }
  bin.install downloaded => "kubekanvas"
  end

  test do
    system "#{bin}/kubekanvas", "--help"
  end
end
