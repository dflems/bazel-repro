`apple_bundle_import.bundle_imports` seems to misbehave when given a tree artifact (via `ctx.actions.declare_directory`):

```
bazel build :framework_with_bundle_from_tree_artifact

ls bazel-bin/SomeFramework.framework/Imported.bundle
```

`Imported.bundle` should have two files, `foo.txt` and `bar.txt`. Instead, it has an intermediate directory `subdir` that contains those files. This is an issue when contained in any bundle, not just a framework.
