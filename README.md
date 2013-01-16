Go-cross
=============
A simple Go Cross-compile helper.

    git clone git://github.com/c9s/go-cross

Then run go-cross-install to build your cross-compile toolchain.

To build toolchain for all platforms and archs, simply run

    bin/go-cross-install darwin/386

To build toolchain for specific platform and arch:

    bin/go-cross-install darwin/386

Add the following lines to your `~/.zshrc` or `~/.bashrc` file:

    $$HOME/.go/go-cross.sh

