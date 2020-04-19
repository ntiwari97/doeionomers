Consider the nafionblock.cml file given in this folder. Say we want to convert it to a MolTemplate compatible (.lt) format. As a simple case, consider the first line in "<atomArray>" of the nafionblock.cml file:  

			<atom id="a1" elementType="C" x3="-8.815673" y3="-1.524410" z3="0.000000"/>

We may assume a format similar to nafionblock.lt:

       atom-id  mol-id   atom-type  charge   x             y                z
      $atom:a1 $mol:...  @atom:C   0.2164   -8.815673      -1.524410         0.000000

Converting between lines is trivial. Writing a Python code would would simply be a matter of parsing the file and adding a column for "charge" to the .lt file. 

For the "<bondArray>" portion of the .cml file, the procedure is similar: 

    <bond atomRefs2="a1 a2" order="1"/>

And for the equivalent bond list section in the nafionblock.lt: 
	
	$bond:c1f1 $atom:a1 $atom:a2

Where '$bond:' is simply an identifier. A Python code would simply have to parse the file and assign some arbitrary (but unique) bond id. 
