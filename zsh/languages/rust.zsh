# configure Rust if cargo has been installed with rustup.
if [ -d "$HOME/.cargo" ]; then
	export PATH=$PATH:$HOME/.cargo/bin
fi
