class Linctl < Formula
  desc "Comprehensive command-line interface for Linear's API"
  homepage "https://github.com/dorkitude/linctl"
  url "https://github.com/dorkitude/linctl/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "1426e5098593104b176473f48e0ebc69ca1800dd9f233645373056fe4a1feb55"
  license "MIT"
  head "https://github.com/dorkitude/linctl.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/dorkitude/linctl/cmd.version=#{version}")
  end

  test do
    # Test version output
    assert_match "linctl version #{version}", shell_output("#{bin}/linctl --version")
    
    # Test help command
    assert_match "A comprehensive CLI tool for Linear", shell_output("#{bin}/linctl --help")
  end
end