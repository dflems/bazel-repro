Using bazel 5, note that `:example` can be built for multiple apple platforms:

```
bazel build :example
bazel build :example --ios_cpu=arm64 --apple_platform_type=ios
bazel build :example --tvos_cpus=arm64 --apple_platform_type=tvos
```

But when building for watchOS, it fails:

```
bazel build :example --watchos_cpus=armv7k --apple_platform_type=watchos
````

```
INFO: Analyzed target //:example (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
ERROR: /Users/xyz/Code/bazel-repro-armv7k/BUILD:1:13: Linking libexample.a failed: (Exit 1): libtool failed: error executing command
  (cd /private/var/tmp/_bazel_xyz/bb587d5706edd406581d9a8d0862e27a/sandbox/darwin-sandbox/14/execroot/__main__ && \
  exec env - \
    APPLE_SDK_PLATFORM=WatchOS \
    APPLE_SDK_VERSION_OVERRIDE=8.0 \
    PATH=... \
    XCODE_VERSION_OVERRIDE=13.0.0.13A233 \
    ZERO_AR_DATE=1 \
  external/local_config_cc/libtool @bazel-out/applebin_watchos-watchos_armv7k-fastbuild-ST-bf37b8f51b77/bin/libexample.a-2.params)
# Configuration: ec9c8ce8f2893852d7e4c89e14dd2b738053d949688affea8829de604737c93a
# Execution platform: @local_config_platform//:host

Use --sandbox_debug to see verbose messages from the sandbox
error: /Applications/Xcode-1300.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool: no library created (no object files in input files matching -arch_only armv7k)
Target //:example failed to build
INFO: Elapsed time: 0.243s, Critical Path: 0.04s
INFO: 2 processes: 2 internal.
FAILED: Build did NOT complete successfully
```

If you run the build clean with `--subcommands`, you'll see that the compilation receives the arguments `-target armv7-apple-watchos` instead of `armv7k-apple-watchos`.
