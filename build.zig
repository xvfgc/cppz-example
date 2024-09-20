const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "tst2",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const cppz_dep = b.dependency("cppz", .{ .target = target, .optimize = optimize });
    exe.root_module.addImport("cppz", cppz_dep.module("cppz"));
    exe.linkLibrary(cppz_dep.artifact("cppz"));

    b.installArtifact(exe); 
}
