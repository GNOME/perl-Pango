package PangoTestHelper;

use Test::More;

my $REQ_GTK2_VERSION = 1.210; # FIXME: 1.22

sub import {
  my $class = shift;
  my %options = @_;

  if ($options{need_gtk}) {
    unless (eval "use Gtk2 $REQ_GTK2_VERSION -init; 1;") {
      plan skip_all => "This test needs Gtk2 >= $REQ_GTK2_VERSION";
    }
  }

  if (exists $options{tests}) {
    plan tests => $options{tests};
  }
}

package main;

use Glib qw/TRUE FALSE/;
use Pango;
use Test::More;

# Inspired by Test::Number::Delta
sub delta_ok ($$;$) {
	my ($a, $b, $msg) = @_;
	ok (abs ($a - $b) < 1e-6, $msg);
}

1;
