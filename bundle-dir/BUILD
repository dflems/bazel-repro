load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")

ios_framework(
    name = "framework_with_bundle_from_tree_artifact",
    bundle_name = "SomeFramework",
    bundle_id = "foo.bar.baz",
    minimum_os_version = "13.0",
    infoplists = ["Info.plist"],
    families = [
        "iphone",
        "ipad",
    ],
    resources = ["//subdir:bundle_from_tree_artifact"],
)
