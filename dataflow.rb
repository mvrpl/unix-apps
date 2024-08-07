class Dataflow < Formula
  desc "ETL configurable written in Rust"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.2.8"
  license "GPL-3.0"

  livecheck do
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/latest.json"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json["version"][regex, 1]
    end
  end

  if OS.linux? 
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.8/dataflow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a6be28fd5afeab04a195d0a913d60dafcce5eb2aea2ca6d785d3d70460cc96d"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.8/dataflow-aarch64-apple-darwin.tar.gz"
      sha256 "da041a2630a8e6822d550a830fe5c6346e0e970f15bcc4e0143c219d9738de5e"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.8/dataflow-x86_64-apple-darwin.tar.gz"
      sha256 "d365c97042e28e00b17482cd15035b746e19ccce42bc1fbe8d9566395ae09601"
    end
  end

  def install
    bin.install "dataflow"
  end
end
