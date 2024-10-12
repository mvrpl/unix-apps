class Dataflow < Formula
  desc "ETL configurable written in Python"
  homepage "https://bitbucket.org/mvrpl_br/dataflow"
  version "0.3.0"
  license "GPL-3.0"

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
