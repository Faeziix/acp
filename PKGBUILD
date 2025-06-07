pkgname=acp
pkgver=0.0.1
pkgrel=1
pkgdesc="Advanced cp with interactive directory selection using zoxide and fzf"
arch=('any')
license=('MIT')
depends=('zoxide' 'fzf')
source=("acp::git+https://github.com/faeziix/acp.git#branch=main")
sha256sums=('SKIP')

package() {
  cd "$srcdir/acp"
  install -Dm755 acp -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
