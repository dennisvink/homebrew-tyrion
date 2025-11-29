class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "020f5adbd3dde37d8833d16ea8bb57f6a336649ab65d40966ea38774a354dee0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    system bin/"tyrion", "hello.ty"
    assert_equal "hi\n"
  end
end
