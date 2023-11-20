use v6.c;
use Test;
use OrderedHash;

plan 2;

sub cmp-default(%h is raw, Mu \default-type) is test-assertion {
    subtest "value type is " ~ default-type.^name => {
        plan 3;
        cmp-ok %h.of, &[===], default-type, "default value type";
        cmp-ok %h<a>, &[===], default-type, "referencing unset key returns default";
        cmp-ok %h<a>:delete, &[===], default-type, "delete non-existing key returns default";
    }
}

my %oh does OrderedHash;
cmp-default %oh, Any;

my %oo does OrderedHash[Str];
cmp-default %oo, Str;

done-testing;
