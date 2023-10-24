build: build_rs
	cmake -B build/Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug
	cmake --build build/Debug

build_rs:
	cd dead_rs && cargo build

build_release: build_rs_release
	cmake -B build/Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release
	cmake --build build/Release

build_rs_release:
	cd dead_rs && cargo build --release

clean:
	rm -rf dead_rs/target
	rm -rf build
