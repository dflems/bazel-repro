def _rule_yielding_bundle_files_impl(ctx):
    bundle_dir = ctx.actions.declare_directory(ctx.attr.bundle_name)

    ctx.actions.run_shell(
        inputs = [],
        outputs = [bundle_dir],
        arguments = [bundle_dir.path],
        command = "touch $1/foo.txt ; touch $1/bar.txt",
    )

    return [DefaultInfo(files = depset([bundle_dir]))]

rule_yielding_bundle_files = rule(
    implementation = _rule_yielding_bundle_files_impl,
    attrs = {
        "bundle_name": attr.string(mandatory = True),
    }
)
