#!/usr/bin/perl
#
our @door=();
our $doors=3;
our $times=10000;
our $pick_count=0;
our $alt_count=0;

print "\n";
for (my $a=0; $a<$doors; $a++) {	
	print "|door$a ";
}
print "|pck|rev|GoodP|alt|GoodA\n";
for (my $a=0; $a<$doors; $a++) {	
	print "+------";
}
print "+---+---+-----+---+-----\n";

for (my $cnt=0; $cnt<$times; $cnt++) {
	my $temp=set_doors();
	my $temp=print_doors();
        my $temp=pick_door();
}
$cp = $pick_count/$times;
$ap = $alt_count/$times;
print "Correct Pick% = $cp\nAlt Pick% = $ap\n";

sub set_doors {
	for (my $a=0; $a<$doors; $a++) {	
		$door[$a]=" bad";
	}
	my $good=rand($doors);
	$door[$good]="good";
}

sub print_doors {
	for (my $a=0; $a<$doors; $a++) {	
		print "| $door[$a] ";
	}
#	print "\n";
}

sub pick_door {
	my $pick=int(rand($doors));
	my $rev=-1;
	my $alt=-1;

	if (rand(2)>1) {
		for (my $a=0; $a<$doors; $a++) {	
			if (($a != $pick)&&($rev<0)&&($door[$a] eq " bad")) {
				$rev=$a;
			}
		}
	} else {
		for (my $a=$doors-1; $a>=0; $a--) {	
			if (($a != $pick)&&($rev<0)&&($door[$a] eq " bad")) {
				$rev=$a;
			}
		}
	}

	for (my $a=0; $a<$doors; $a++) {	
		if (($a == $pick)||($a == $rev)) { 
			my $temp=0;
		} else {
			$alt=$a;
		}
	}

	if ($door[$pick] eq "good") {
		$good_pic="true ";
		$pick_count++;                      
	} else {
		$good_pic="false";
	}
	if ($door[$alt] eq "good") {
		$good_alt="true ";
		$alt_count++;
	} else {
		$good_alt="false";
	}

	print "| $pick | $rev |$good_pic| $alt |$good_alt\n";
}

