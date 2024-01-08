class PhpCsFixer < Formula
  desc "Tool to automatically fix PHP code style"
  homepage "https://github.com/FriendsOfPHP/PHP-CS-Fixer"
  url "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v3.46.0/php-cs-fixer.phar"
  sha256 "c79357af875009afaf5ddd038f891a305d274b13bd742fd9fb786bd2e0c7803b"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "2365367aa5afcf218b5ffacbaa2d76607fb66ab04e5163d250941deeb8378f91"
  end

  depends_on "php"

  def install
    bin.install "php-cs-fixer.phar" => "php-cs-fixer"
  end

  test do
    (testpath/"test.php").write <<~EOS
    <?php $this->foo(   'homebrew rox'   );
    EOS
    (testpath/"correct_test.php").write <<~EOS
      <?php

      $this->foo('homebrew rox');
    EOS
    system "#{bin}/php-cs-fixer", "fix", "test.php"
    assert compare_file("test.php", "correct_test.php")
  end

