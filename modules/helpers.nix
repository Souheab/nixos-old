{ lib, ...}:
{
  functions = rec {
    mkIfElse = cond: yes: no: lib.mkMerge [
      (lib.mkIf cond yes)
      (lib.mkIf (!cond) no)
    ];
    mkIfMerge = cond: mergedInto: toBeMerged: lib.mkMerge [
      mergedInto
      (lib.mkIf cond toBeMerged)
    ];
    mkIfElseMerge = cond: mergedInto: toBeMergedIfYes: toBeMergedIfNo: lib.mkMerge [
      mergedInto
      (mkIfElse cond toBeMergedIfYes toBeMergedIfNo)
    ];
  };
}
