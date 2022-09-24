#!/usr/bin/perl
# Jeremy English 20-August-2007

#read a file from stdin
#if the line contains an op code save it
#sort the opcodes found
#print the unique list

sub contains {
    my ($item,@l) = @_;
    foreach (@l){
	if (/$item/i){
	    return 1;
	}
    }
    return 0;
}

sub main {
    my @ops = ("ADC","AND","ASL","BIT","BPL","BMI","BVC","BVS","BCC","BCS","BNE","BEQ","CMP","CPX","CPY","DEC","EOR","CLC","SEC","CLI","SEI","CLV","CLD","SED","INC","JMP","JSR","LDA","LDX","LDY","LSR","NOP","ORA","TAX","TXA","DEX","INX","TAY","TYA","DEY","INY","ROR","ROL","RTI","RTS","SBC","STA","TXS","TSX","PHA","PLA","PHP","PLP","STX","STY");

    my @l;
    while(<>){
	chomp;
	if (/(.+)\s([a-zA-Z]{3})\s(.*)/){
	    s/(.+)\s([a-zA-Z]{3})\s(.*)/$2/g;
	    my $i = $_;
	    $i =~ tr/a-z/A-Z/;
	    if (contains($i,@ops)){
		push @l, $i;
	    }
	}
    }
    my @sl = sort { $a cmp $b} @l;
    my %seen = ();
    my @unique = grep{ ! $seen{ $_ }++ } @sl;
    print "$_\n" foreach @unique;
}

main;
	
