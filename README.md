# VASP Postprocessing Tools
A collection of scripts for post-processing the [VASP](https://www.vasp.at) (The Vienna Ab initio simulation package) results

## vasp_ab.sh
This script reads the final Kohn-Sham eigenvalues, and Kohn-Sham orbitals' occupation of each spin channel from the OUTCAR file of a spin-polarized VASP calculation and writes them into a single text file side by side for all the k-points.
### Examples
```shell
$ ./vasp_ab.sh
```
Reads the data from the “OUTCAR.gz” or “OUTCAR” file and writes the results to the “OUTCAR.AB”

```shell
$ ./vasp_ab.sh vaspfile abfile
```
Reads the data from the “vaspfile” and writes the results to the “abfile”
