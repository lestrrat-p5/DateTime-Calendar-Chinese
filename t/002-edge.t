use strict;
use blib "/Users/daisuke/git/DateTime-Util-Astro";
use blib "/Users/daisuke/git/DateTime-Event-Chinese";
use Test::More tests => 13;
use_ok("DateTime::Calendar::Chinese");

# XXX - going from a non-leap year to a leap-year was causing much
# unhappiness... we explicitly check for the boundary case where
# we go from one year to the other

# Note, make sure the year and the previous years are in the same cycle

my @data = (
    #  new year - 1 day
    DateTime->new(year => 2003, month => 1, day => 31, time_zone => 'UTC'),
    DateTime->new(year => 2004, month => 1, day => 21, time_zone => 'UTC')
);

foreach my $dt (@data) {
    my $cc_ny_eve = DateTime::Calendar::Chinese->from_object(object => $dt);
    my $cc_ny     = DateTime::Calendar::Chinese->from_object(
        object => $dt + DateTime::Duration->new(days => 1));

    is($cc_ny_eve->cycle, $cc_ny->cycle);
    is($cc_ny_eve->cycle_year + 1, $cc_ny->cycle_year);
    is($cc_ny_eve->month, 12);
    like($cc_ny_eve->day, qr(^29|30));
    is($cc_ny->month, 1);
    is($cc_ny->day, 1);
}

