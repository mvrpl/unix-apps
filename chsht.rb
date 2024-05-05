class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    version "0.3.0"

    livecheck do
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/latest.json"
        regex(/^v?(\d+(?:\.\d+)+)$/i)
        strategy :json do |json, regex|
            json["version"][regex, 1]
        end
    end

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-linux-amd64"
        sha256 "777cba57700514285a9e1c9f37c394224a7f25aecfc87782cf03e942074254ad"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
            sha256 "492b0b597ee75b906e64a679988ef1b564c19c53c87f527f4ae22927a1329dcf"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
            sha256 "e3d2b47142b1ae530fd8f15c91ab7c2960404f782643b9a443c5a99db69a5f6e"
        end
    end
    
    depends_on "less"
    
    def install
        if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "chsht-linux-amd64" => "chsht"
        end

        if OS.mac?
            if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
                bin.install "chsht-macos-arm64" => "chsht"
            end

            if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
                bin.install "chsht-macos-amd64" => "chsht"
            end
        end
    end
end
