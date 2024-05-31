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
      sha256 "775fc350295504dadb7967b1a3553ad03129a7b35bcf9076ffc6ebdee55e0cff"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-aarch64-apple-darwin.tar.gz"
      sha256 "cb98b6a9249072d89f559cf75f6c370884286351b9ecd9748f9b7eccb4db38a6"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0378fec8a02b8dafe9562125dd64362daf36782e097497406c11e08c74dab495"
    end
  end

  def install
    bin.install "dataflow"
  end
end
