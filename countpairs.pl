use v6;

my $file=open 'wordpairs.txt';

my %dict;
my $line;

repeat {
    $line=$file.get;
    my ($p1,$p2)=$line.split(' ');
    if ?%dict{$p1} {
        %dict{$p1} = "{%dict{$p1}} {$p2}".words;
    } else {
        %dict{$p1} = $p2;
    }
} while !$file.eof;

say "The pairs count of the key word \"her\" in wordpairs.txt is {%dict{"her"}.elems}";

# vim: ft=perl6
