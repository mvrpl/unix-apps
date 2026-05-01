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

    libexec.install Dir["*"]

    renamed_bins = {
      "spark-shell"  => "spark3-shell",
      "spark-submit" => "spark3-submit",
      "pyspark" => "pyspark3",
      "spark-sql" => "spark3-sql",
    }

    renamed_bins.each do |original, renamed|
      (bin/renamed).write_env_script libexec/"bin/#{original}", Language::Java.overridable_java_home_env("17")
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/spark3-submit --version 2>&1")
    assert_match "version #{version}", output
  end
end
