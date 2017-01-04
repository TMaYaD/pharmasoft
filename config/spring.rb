# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }
