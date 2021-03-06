class Qcachegrind < Formula
  desc "Visualize data generated by Cachegrind and Calltree"
  homepage "https://kcachegrind.github.io/"
  url "http://download.kde.org/stable/applications/16.08.1/src/kcachegrind-16.08.1.tar.xz"
  sha256 "8f3aae221a683d190fc5607240007c3affc88e8af5ebfba787fd6ca38409f1b4"

  bottle do
    cellar :any
    sha256 "0cea2d593204c50bc842a46bf2963447f374eb57b6bb0edd47d8db9473be7316" => :el_capitan
    sha256 "240c97e6d9f83416ac0ea50a7ccc03c295e6fc3937e9bd9066b6bed3fd2fa81f" => :yosemite
    sha256 "097cf0dfa43c444b17637ea69d1127d8e5c4e94545fb1107f3dbb71ea219d6f6" => :mavericks
  end

  depends_on "graphviz" => :optional
  depends_on "qt5"

  def install
    cd "qcachegrind"
    system "#{Formula["qt5"].bin}/qmake", "-spec", "macx-clang", "-config", "release"
    system "make"
    # Install app
    prefix.install "qcachegrind.app"
    # Symlink in the command-line version
    bin.install_symlink prefix/"qcachegrind.app/Contents/MacOS/qcachegrind"
  end

  test do
    File.executable? bin/"qcachegrind"
  end
end
