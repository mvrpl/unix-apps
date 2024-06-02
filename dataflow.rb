class Dataflow < Formula
  desc "ETL configurable written in Rust"
  homepage "https://github.com/mvrpl/dataflow"
  version "0.2.1"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? 
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "failed"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-aarch64-apple-darwin.tar.gz"
      sha256 "failed"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-x86_64-apple-darwin.tar.gz"
      sha256 "failed"
    end
  end

  def install
    bin.install "dataflow"
  end
end
