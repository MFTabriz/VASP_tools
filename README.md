# VASP Postprocessing Tools
A collection of scripts for post-processing the [VASP](https://www.vasp.at) (The Vienna Ab initio simulation package) results

## vasp_ab.sh
This script reads OUTCAR file of a spin-polarized VASP calculation and writes the final KS energy levels and occupation numbers of each spin channel of all k-points side by side into a text file.
### Examples
```shell
$ ./vasp_ab.sh
```
Reads the “OUTCAR.gz” or “OUTCAR” file and writes to the “OUTCAR.AB”

```shell
$ ./vasp_ab.sh vaspfile abfile
```
Reads the data from the “vaspfile” and writes the results to the “abfile”
