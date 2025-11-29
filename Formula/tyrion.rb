class Tyrion < Formula
  desc "A tiny programming language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a8f033ac762393b802dc3789398834bcdc977bc9f9b18ace0776a9e8e628ad43"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    system "#{bin}/tyrion", "hello.ty", "hello_bin"
    assert_equal "hi\n", shell_output("./hello_bin")
  end
end
