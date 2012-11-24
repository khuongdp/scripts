 perl -lne '(/(SELECT \w+|UPDATE \w+|INSERT INTO \w+)/)&&$x{$1}++;END{for(sort keys %x){print "$x{$_} $_"}}' $1
