#!/usr/bin/perl -w

# 4 February 2011		Lenna Xiao Ping Peterson
# binomial probability finder for stat 503

## modified from python written by jmelloy
sub factorial_it {
	my($x) = @_;
	my $total = 1;
	while ( $x > 1) {
		$total *= $x;
		$x -= 1;
	}
	return $total;
}

sub factorial {
	my($x) = @_;
	return 1 if $x <= 1;
	return $x * &factorial_it($x - 1);
}

sub combine {
	my($n, $k) = @_;
	if ($k == $n/2) {
		return &factorial($n) / ( &factorial($k) * &factorial($n-$k) );
	} else {
		if ($k > $n/2) {
			$k = $n - $k;
		}
		my $numerator = 1;
		foreach $i (0 .. $k-1) {
			$numerator *= $n-$i;
		}
		return $numerator / &factorial($k);
	}
}

print "Number of trials?\n";
$n = <STDIN>;
chomp $n;
print "Chance of success?\n";
$p = <STDIN>;
chomp $p;
unless ($p >= 0 && $p <= 1) {
	print "Chance of success must be between 0 and 1. Try again:\n";
	$p = <STDIN>;
	chomp $p;
}

SUCCESS: {
	print "Number of successes?\n";
	$k = <STDIN>;
	chomp $k;

while ($k ne ("exit" || "quit")) {
	$combine = &combine($n,$k);
	$second = $p**$k * (1-$p)**($n-$k);
	$probability = $combine*$second;

	# print "n: $n\tk: $k\tp: $p\n";
	print "$n choose $k: $combine\n";
	print "product: $second\n";
	print "probability: $probability\n";
	next SUCCESS;
}
}


# Pr (Y = k) = nCk * pow(p,k) * pow((1-p),(n-k))

