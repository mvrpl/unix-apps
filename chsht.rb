class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    version "0.2.9"

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-linux-amd64"
        sha256 "99cdcaf626a0eed1c00cfe350e9655b69f05818342ac69a4f1aa2e7d26e22303"
    end

    if OS.mac?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-arm64"
        end

        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/#{version}/chsht-macos-amd64"
        end

        sha256 "113ddb0b26503b66860b1295b73252f36ce0939bb581af2b223dcbae64784dd1"
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
