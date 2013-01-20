#!/usr/bin/perl

%ages = ("Michael Caine",    39,
         "Dirty Den",        34,
         "Angie",            27,
         "Willy",            "21 in dog years",
         "The Queen Mother", 108);
my %hash = ('a' => 2, 
            'b' => 3,
            'c' => 1);
my %hash = (a => 1,
            b => 2); # 如果key是字符串，可以省略引号

# 按value排序
foreach my $key (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
  print %key,'=>',$hash{$key},"\n";
}

# 因为返回值是一个scalar var，所以前缀$
$ages{"Michael Caine"}; # return 39
$ages{"Willy"};         # return "21 in dog years"

delete $hash{a}; # 删除一个
undef %hahs;     # 清空

exists($hash{$key})

$hash_size = scalar keys $hash

# associative array 和list array互转
@info = %ages;
%moreages = @info; 

# %ages无序，不过keys和values函数返回的值顺序相同，不一定和传入时相同
@keys = keys %ages;
@values = values %ages;
# 从大到小排序
@keys = sort{$hash{$b} <=> $hash{$a}} (keys %hash)
# 从小到大排序
@keys = sort{$hash{$a} <=> $hash{$b}} (keys %hash)
@keys = sort{$hash{$a} cmp $hash{$b}} (keys %hash)

# 遍历
while (my ($person, $age) = each %age )
{
  # do
}

# 引用
$h_ref = \%hash; # 获得一个hash的reference
$aHash = %{$h_ref} # 当成hash用
$value = $h_ref -> {akey} # 类似$hash{akey}

# 传递hash到函数
$hash{a} = 1;
foo(\%h);
print $h{b}, "\n";
sub foo {
  my ($hash) = @_; 
  print $hash -> {a}, "\n";
  $h -> {b} = 2; 
}

sub foo {
  my %fh;
  $fh{a} = 1;
  return %fh;  
}
my %h = foo(); # 这里将%fh整个copy到%h，效率低,考虑下面的返回ref方式

sub foo {
  my %fh;
  $fh{a} = 1;
  return \%fh; 
}
my $hr = %{foo()};
