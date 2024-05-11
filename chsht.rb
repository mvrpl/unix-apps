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
        sha256 "c6bb7006d87b052edff370500413281db07808e929ca1fb8c2c0b9061701cc6c"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
            sha256 "0399422a638b04021fa0fd6f362d7202b2b5c9e6ad1f4c314e9db7601e9e106d"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
            sha256 "64c52f54a6e2b6d0d81ad27043159f1a201c7fd1e3243b2ccabe3d7726b160f1"
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
