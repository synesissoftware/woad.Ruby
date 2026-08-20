# woad.Ruby - TODO <!-- omit in toc -->


## Functional improvements

* [x] ~~~SGR colour and reset codes~~~ ✅;
* [ ] TTY-conditional colour codes (process and per-stream);
* [ ] Windows virtual-terminal gating (OS build + `GetConsoleMode`);


## Performance improvements

* \<none>


## Packaging improvements

* [x] ~~~added **run_all_unit_tests.sh** (from **misc-dev-scripts**) that skips `tput` when `$TERM` is unset or stdout is not a TTY~~~;
* [x] ~~~**Gemfile** `lockfile false`; gitignore **Gemfile.lock**; CI `bundler-cache: false`~~~;
* [x] ~~~gemspec polish: README tagline as `spec.summary`, drop `< 5` upper bound, package docs, exclude **Gemfile.lock** / **.ruby-version**~~~;
* [x] ~~~README canonical structure (tagline before badges; **Dependencies**; CI badge → **ruby.yml**); added **examples/print_status**~~~;
* [x] ~~~after the packaging/boilerplate/CI baseline: bump **VERSION** and align **CHANGES**/**NEWS**~~~;


<!-- ########################### end of file ########################### -->
