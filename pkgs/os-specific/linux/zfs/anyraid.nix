{
  callPackage,
  nixosTests,
  ...
}@args:

callPackage ./generic.nix args {
  # You have to ensure that in `pkgs/top-level/linux-kernels.nix`
  # this attribute is the correct one for this package.
  kernelModuleAttribute = "zfs_anyraid";

  kernelMinSupportedMajorMinor = "4.18";
  kernelMaxSupportedMajorMinor = "6.16";

  # this package should point to a version / git revision compatible with the latest kernel release
  # IMPORTANT: Always use a tagged release candidate or commits from the
  # zfs-<version>-staging branch, because this is tested by the OpenZFS
  # maintainers.
  version = "2.4.0-rc1";
  rev = "7c87ca34ecb0449aa0953ac1ea28837d9723803a";
  owner = "KlaraSystems";

  tests = {
    inherit (nixosTests.zfs) anyraid;
  };

  hash = "sha256-IyrAt/tLeZAu1vN9d8NR90RmFs7X5P8vWWZnzrW95sY=";

  extraLongDescription = ''
    This is Klara Systems anyraid that has not been merged into mailine ZFS
  '';
}
