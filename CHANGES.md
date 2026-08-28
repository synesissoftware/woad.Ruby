# woad.Ruby - Changes <!-- omit in toc -->


## 0.0.3 - 28th August 2026

* updated GitHub Actions checkout references to **v7**;
* added exclusions for obsolete Ruby versions to **.ruby-version-exclusions**;
* corrected the **woad** related-project description to include **C++**;
* retained the Ruby 2.0+ gem requirement and corrected shared project URL metadata;


## 0.0.2 - 19th August 2026

* **EXAMPLES.md** catalog and **examples/print_status**;
* reordered **README.md** (canonical sections; **Examples**; **Dependencies** Efferent / Afferent); dropped GitHub-release badge;
* expanded **woad.gemspec** `spec.summary` to the README tagline; packaged **AUTHORS**, **CHANGES**, **CONTRIBUTING**, **EXAMPLES**, **FAQ**, **INSTALL**, **NEWS**, **SECURITY**, and **TODO**;
* **woad.gemspec**: `required_ruby_version` is the range `>= 2.0` (dropped `< 5`); **Gemfile.lock** and **.ruby-version** excluded from `spec.files`;
* **Gemfile** sets `lockfile false` when Bundler supports it; **.gitignore** includes **Gemfile.lock**; CI uses `bundler-cache: false` because Bundler 4 then writes no lockfile and **ruby/setup-ruby** cache cats **Gemfile.lock**;
* CI **Warnings** job now runs on Ruby **3.4** via **run_all_unit_tests.sh** `--lib --warnings`;
* added **run_all_unit_tests.sh** (from https://github.com/synesissoftware/misc-dev-scripts) that skips **tput** when **$TERM** is unset or stdout is not a TTY;
* library source **Home:** URL now uses `https`;


## 0.0.1 - 15th August 2026

* SGR colour and reset codes (`RESET`, `FG_*`, `BG_*`, including bright variants);


## 0.0.0 - 15th August 2026

* initial project scaffolding;
* **Ruby** **2.0+** compatibility;


<!-- ########################### end of file ########################### -->
