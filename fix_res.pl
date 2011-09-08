#!/usr/bin/env perl
use strict;
use warnings;

my $xrandr_path = determine_xrandr_path();
my $display_1 = 'LVDS1';
my $display_2 = 'VGA1';
my $command = "$xrandr_path --output $display_1 --mode 1366x768";
$command .= " --output $display_2 --right-of $display_1 --mode 1680x1050" if is_connected($display_2, $xrandr_path);
sleep(3);
system($command);

sub determine_xrandr_path {
	my $xrandr_path = `which xrandr`;
	chomp($xrandr_path);
	return "$xrandr_path";
}

sub is_connected {
	my $display = shift;
	my $xrandr_path = shift;
	
	if (`$xrandr_path|grep $display` =~ /$display connected/){
		return 1;
	}else{
		return 0;
	}
}
