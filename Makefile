
gen:
	dart run build_runner build

gen-c:
	dart run build_runner build --delete-conflicting-outputs

clean:
	dart run build_runner clean


