#!/usr/bin/perl
$numArgs = @ARGV;
$p = 0;
$usage = "Usage: BadUsers.pl [-p] \n";

print "COMEN�O\n";
if ($numArgs != 0)
  {
    print "Hi ha arguments\n";
    if ($numArgs == 1)
      {
	print "Nom�s 1\n";
	if ($ARGV[0] eq "-p")
	  {
	    $p = 1;
	  }
	else
	  {
	    print $usage;
	    exit (1);
	  }
      }
    else
      {
	print "On vas a parar??\n";
	print $usage;
	exit (1);
      }
  }
$pass_db_file = "/etc/passwd";
open (FILE, $pass_db_file)
     or die "no es pot obrir el fitxer $pass_db_file:$!";
@password_db = <FILE>;
     close FILE;

foreach $user_line (@password_db)
{

  chomp ($user_line);

  @fields = split (':', $user_line);
  $user_id = $fields[0];
  $user_home = $fields[5];
  if (-d $user_home)
    {
      print "userhome      -->  $user_id \n";
      $comand = sprintf ("find %s -type f -user %s | wc -l",
			 $user_home, $user_id);
      $find_out = `$comand `;
    }
  else
    {
      print "no userhome  -->";
      $find_out = 0;
    }
  if ($find_out == 0)
    {
      print "findout == 0\n";
      $invalid_users
      {
      $user_id}
      = "invalid";
      print $invalid_users;
    }

}

if ($p == 1)
  {
    @process_list = `ps aux --no -headers`;
    foreach $process_list_line (@process_list)
    {
      chomp ($process_list_line);
      @fields_proc = split ("/^[]*$/",$process_list_line);
      $user_proc = $fields_proc[0];
      delete ($invalid_users
	      {
	      $user_proc}
      );
    }
  }

foreach $user_inv_id (sort ((keys % invalid_users)))
{
  print "$user_inv_id\n";
}
