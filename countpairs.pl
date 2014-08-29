use v6;

my $file=open 'wordpairs.txt';

my %dict;

for $file.lines -> $line {
    my ($p1,$p2)=$line.split(' ');
    if ?%dict{$p1} {
        %dict{$p1} = "{%dict{$p1}} {$p2}".words;
    } else {
        %dict{$p1} = $p2;
    }
}

say "The pairs count of the key word \"her\" in word-pairs.txt is {%dict{"her"}.elems}";

# vim: ft=perl6
