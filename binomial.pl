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

$n = 8;
$k = 4;
$p = .4;

# Pr (Y = k) = nCk * pow(p,k) * pow((1-p),(n-k))

$combine = &combine($n,$k);
$second = $p**$k * (1-$p)**($n-$k);
$probability = $combine*$second;

print "n: $n\tk: $k\tp: $p\n";
print "$combine\n$second\n$probability\n";