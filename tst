
use lib 'lib';
#use blib '/Users/gbarr/work/public/mongo-perl-driver';
use AnyEvent::MongoDB;
    use Data::Dump;
    use Devel::Peek;

my $m = AnyEvent::MongoDB->new;
my $d = $m->pool->get_database('us-devel-stats');
my $c = $d->get_collection('events_20100524');


#$c->find(
#{foobar => 123456},
#  cb => sub {
#    warn "done";
#  },
#  limit => 10,
#  page => 2,
#);
my @c;
foreach my $z (5,7) {

my $i;

push @c, 1, $c->find(
  cb => sub {
    warn $z," ",++$i," ",$#_,"\n"; #dd(@_);
    warn shift @c;

    $i < $z;
  },
  limit => 10,
  page => 2,
  skip => $z * 3,
);
}

#$c->find(
#{foobar => 1}, timeout => 100, cb => sub { dd(@_) });

AnyEvent->one_event while 1;
__END__


$m->connect;
my $t = AnyEvent->timer(after => 3, cb => sub { 
warn $m->master;
$m->get_database('us-devel-stats')->get_collection('events')->find(cb => sub {
#use Data::Dump; dd(@_);
warn $#_," ",++$xx;
return 1;
}, exhaust => 1, limit => -49922);
#$m->get_database('gmb')->get_collection('test')->find_one(query => { gmb => 99}, limit => 4, cb => sub {
#use Data::Dump; dd(@_);
#});
});
AnyEvent->one_event while 1;

