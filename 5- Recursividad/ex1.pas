
{
	Write a recursive function that given
	an input n, sums all nonnegative int-
	egers up to n.

	Base case: n = 0 ==> rf:= 0

	Recursive case: n > 0 ==> rf:= n + rf(n - 1)
}
program ex1;
var
	n: integer;
	
	function rf(n: integer): integer;
	begin
		if (n = 0) then
			rf:= 0
		else
			rf:= n + rf(n - 1);
	end;
begin
	write('Enter a number: '); 
	readln(n);
	writeln('Result is: ', rf(n));
end.
