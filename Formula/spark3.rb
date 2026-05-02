class Spark3 < Formula
  desc "A unified analytics engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  version "4.1.1"
  license "Apache-2.0"

  url "https://dlcdn.apache.org/spark/spark-4.1.1/spark-4.1.1-bin-hadoop3.tgz"
  sha256 "f5874d9d6a4935f26bc9f761467971d26812a17d94c6493b8eb4b810e7db31ae"

  depends_on "openjdk@17"

  def install
    rm_f Dir["bin/*.cmd"]

    renamed_bins = {
      "spark-shell"  => "spark3-shell",
      "spark-submit" => "spark3-submit",
      "pyspark" => "pyspark3",
      "spark-sql" => "spark3-sql",
    }

    renamed_bins.each do |original, renamed|
      bin.install bin/original => bin/renamed
    end
  end

  test do
    output = shell_output("#{bin}/spark3-submit --version 2>&1")
    assert_match "version #{version}", output
  end
end
