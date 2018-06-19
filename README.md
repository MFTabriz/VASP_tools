# VASP Postprocessing Tools
A collection of scripts for post-processing the [VASP](https://www.vasp.at) (The Vienna Ab initio simulation package) results

## vasp_ab.sh
This script reads the final Kohn-Sham eigenvalues, and Kohn-Sham orbitals' occupation of each spin channel from the OUTCAR file of a spin-polarized VASP calculation and writes them into a single text file side by side for all the k-points.

**Note**: The script overwrites any existing output file!

### Examples
```shell
$ ./vasp_ab.sh
```
Reads the data from the “OUTCAR.gz” or “OUTCAR” file and writes the results to the “OUTCAR.AB”

```shell
$ ./vasp_ab.sh vaspfile abfile
```
Reads the data from the “vaspfile” and writes the results to the “abfile”

### Dependencies
* General:
    * [head](https://en.wikipedia.org/wiki/Head_(Unix))
    * [tail](https://en.wikipedia.org/wiki/Tail_(Unix))
    * [cut](https://en.wikipedia.org/wiki/Cut_(Unix))
    * [paste](https://en.wikipedia.org/wiki/Paste_(Unix))
* For uncompressed files:
    * [grep](https://en.wikipedia.org/wiki/Grep)
    * [less](https://en.wikipedia.org/wiki/Less_(Unix))
* For compressed files:
    * [zgrep](https://linux.die.net/man/1/zgrep)
    * [gunzip](https://linux.die.net/man/1/gunzip)

