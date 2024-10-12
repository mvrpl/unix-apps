class Dataflow < Formula
  desc "ETL configurable written in Python"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.3.0"
  license "GPL-3.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "4fcdce1b4936433d5914e3e7143f9e429e651d1139fed1610b73bfd5c1e7ba66"
  end

  depends_on "python@3.11"

  def install
    system "#{Formula["python@3.11"].opt_bin}/python3.11", "-m", "pip", "install", "dataflow"
    cd "dataflow" do
      (bin/"dataflow").write <<~EOS
        #!/bin/bash
        set -e
        #{Formula["python@3.11"].opt_bin}/python3.11 -m dataflow $@
      EOS
    end
  end
end
