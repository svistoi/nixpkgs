{
  callPackage,
  nixosTests,
  ...
}@args:

callPackage ./generic.nix args {
  extraPatches = [ ./anyraid-dup.patch ];

  # You have to ensure that in `pkgs/top-level/linux-kernels.nix`
  # this attribute is the correct one for this package.
  kernelModuleAttribute = "zfs_anyraid";

  kernelMinSupportedMajorMinor = "4.18";
  kernelMaxSupportedMajorMinor = "6.19";

  # this package should point to a version / git revision compatible with the latest kernel release
  # IMPORTANT: Always use a tagged release candidate or commits from the
  # zfs-<version>-staging branch, because this is tested by the OpenZFS
  # maintainers.
  # https://github.com/KlaraSystems/zfs/commits/anyraid/
  version = "2.5.0";
  rev = "6bceacd9d9be4e1106ce52f53586cec91eef14de";
  owner = "KlaraSystems";

  tests = {
    inherit (nixosTests.zfs) anyraid;
  };

  hash = "sha256-bH7TDyQXJ2QHOJzK6HGMkaVuPfr1PrYecL4vZ5yPxCI=";

  extraLongDescription = ''
    This is Klara Systems anyraid that has not been merged into mailine ZFS
  '';
}
