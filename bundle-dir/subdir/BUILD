load("@build_bazel_rules_apple//apple:resources.bzl", "apple_bundle_import")
load(":helper.bzl", "rule_yielding_bundle_files")

apple_bundle_import(
    name = "bundle_from_tree_artifact",
    bundle_imports = [":tree_artifact_yielding_bundle"],
    visibility = ["//visibility:public"],
)

rule_yielding_bundle_files(
    name = "tree_artifact_yielding_bundle",
    bundle_name = "Imported.bundle",
)
