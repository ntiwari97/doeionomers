This folder contains five files which are required to produce LAMMPS-ready files. The files are:

     - nafionblock.lt
     - nafion117.lt
     - ptfeffamber.lt
     - system.lt
     - cf2group.lt

Note that all of these five files were generated completely by hand. There is no automated facility for generating these files. 

DESCRIPTIONS:
---------------------------------------------------------------------------------------------------------------------------------------
The following files must be imported for nafionblock.lt to run:

    	     - ptfeffamber.lt
	      

nafionblock.lt contains information pertaining to the Nafion side chain. The format of each line in the 'write('Data Atoms')' section is:

##	       	       atom-id  mol-id   atom-type  charge   x             y                z             ##

Where atom-id is an arbitrary label used for identifying a particular atom, mol-id is an arbitrary label used for identifying the
molecule to which this atom belongs (mol-id is rarely used), atom-type is element (i.e. C, H, N, O), charge is the charge on at a
particular atom, and x, y and z are the coordinates of a particular atom. An example line follows:
 
##      	      $atom:c1 $mol:...  @atom:C   0.2164   0.00000      0.000000         0.00000         ##

Where an Carbon atom with the identifier 'c1' has a charge of 0.2164 eV and a postion of [0, 0, 0]

The format for each line in the 'write('Data Bond List') section is:

##    	       	       bond-id  atom-id-1  atom-id-2                                                      ##

Where the bond-id is, again, some arbitrary identifier, and atom-id-1 and atom-id-2 are the identifiers which were specified for each atom
in the 'write('Data Atoms')' section.
---------------------------------------------------------------------------------------------------------------------------------------
The following files must be imported for cf2group.lt to run:

    	     - ptfeffamber.lt

The format of cf2group.lt is identical to nafionblock.lt.

---------------------------------------------------------------------------------------------------------------------------------------
The following files must be imported for nafion117.lt to run:

    	     - ptfeffamber.lt
	     - nafionblock.lt
	     - cf2group.lt 


nafion117.lt contains information for building the entire Nafion 117 polymer chain. It builds the Nafion 117 chain from nafionblock.lt and
cf2group.lt. Coordinates are not specified the same in this file as they are in cf2group.lt and nafionblock.lt. Instead, we first create a backbone
chain with 165 CF2 units. Thus:


##      	       	   	   monomers = new CF2[165].rot(180,1,0,0).move(1.5,0,0)                   ##


We then delete some monomers to splice in the the side-chains:


##   	       	    	     	   delete monomers[15]                                                    ##


We splice in side-chains with the following command:


##                     monomers[18] = new nafionblock.move(27.000000,0,0)                                 ##
	    

And we define bonds the same way as in the other files.
-----------------------------------------------------------------------------------------------------------------------------------------
No files must be imported in order for ptfeffamber.lt to run. 

In the 'write_once("In Init")' section, we define a number of parameters. These parameters are defined exactly the way they would be in 
a LAMMPS input file. Descriptions for each line of this section may be found in the LAMMPS documentation. **NOTE** here, we specify "real" units.
This package specifies: 

    mass = grams/mole
    distance = Angstroms
    time = femtoseconds
    energy = Kcal/mole
    velocity = Angstroms/femtosecond
    force = Kcal/mole-Angstrom
    torque = Kcal/mole
    temperature = Kelvin
    pressure = atmospheres
    dynamic viscosity = Poise
    charge = multiple of electron charge (1.0 is a proton)
    dipole = charge*Angstroms
    electric field = volts/Angstrom
    density = gram/cm^dim

These units apply to every .lt file specified in this folder. 

The section labeled "Non-bonded pair interactions" is where coefficients for Lennard Jones interactions are specified, according to the LAMMPS input format for the LJ potential

The section labeled "Bonded pair interactions" is where coefficients for the harmonic bond potential are specified, according to the LAMMPS input format for the harmonic potential

etc, etc for "Angle Interactions" and "Dihedral Interactions" 




















