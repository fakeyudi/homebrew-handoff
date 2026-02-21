class Handoff < Formula
  desc "CLI tool that tracks developer activity and generates shareable context bundles"
  homepage "https://github.com/fakeyudi/handoff"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fakeyudi/handoff/releases/download/v1.1.1/handoff-darwin-amd64"
      sha256 "9bae9f491da1da72782256be113c5038ebff1dc69ad3f88e9755f04bfa1626cf"
    end
    on_arm do
      url "https://github.com/fakeyudi/handoff/releases/download/v1.1.1/handoff-darwin-arm64"
      sha256 "cde39b5bed143cef6cb1a86440ffbcf23c303841ee6827ba47a18db406833b78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fakeyudi/handoff/releases/download/v1.1.1/handoff-linux-amd64"
      sha256 "6e9f0247aeaaa40a144f25debc2a338bf61b06fb7db3149b5b2eb86370f9158c"
    end
    on_arm do
      url "https://github.com/fakeyudi/handoff/releases/download/v1.1.1/handoff-linux-arm64"
      sha256 "e810baea4f517a88b1b291b58f5ed79df3d1c3cc9c4c3164244bff06a1bdff4d"
    end
  end

 def install
    # Determine the binary name based on OS and architecture
    binary_name = case [OS.kernel_name, Hardware::CPU.arch]
                  when ["Darwin", "arm64"]
                    "handoff-darwin-arm64"
                  when ["Darwin", "x86_64"]
                    "handoff-darwin-amd64"
                  when ["Linux", "arm64"]
                    "handoff-linux-arm64"
                  when ["Linux", "x86_64"]
                    "handoff-linux-amd64"
                  end
    
    bin.install binary_name => "handoff"
  end

  test do
    system "#{bin}/handoff", "--version"
  end
end