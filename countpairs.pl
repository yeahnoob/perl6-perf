my %dict;

grammar WordPairs {
    token word-pair { (\S*) ' ' (\S*) "\n" }
    token TOP { <word-pair>* }
}

class WordPairsActions {
    method word-pair($/) { %dict{$0}.push($1) }
}

my $match = WordPairs.parse(slurp, :actions(WordPairsActions));
say ?$match;
 
say "The pairs count of the key word \"her\" in wordpairs.txt is {%dict{"her"}.elems}";
