# fpm-netcdf

Minimal example of using netcdf-fortran with conda in your fpm project.


### Step 1: Create and activate the environment for your project:

```
conda create --name fpm_netcdf_env
conda activate fpm_netcdf_env
```

### Step 2: Get [netcdf-fortran](https://anaconda.org/conda-forge/netcdf-fortran) from the conda-forge channel:

```
conda install -c conda-forge netcdf-fortran
```

### Step 3: Edit your toml file

In the .toml file for your fpm project, add the following to your [build] section

```toml
[build]
external-modules = ["netcdf"]
```

### Step 4: Build and run your fpm projects with the relevant flags

Running `nf-config --flibs` should return the conda netcdf lib path and libs. For example:

*-L/your/conda/environment/folder/fpm_netcdf_env/lib -lnetcdff -lnetcdf*


Running `nf-config --fflags` should return the conda netcdf include path. For example:

*-I/your/conda/environment/folder/fpm_netcdf_env/linclude*

These need to be specified when building or running your fpm project. You can do this by:

```
fpm build --flag "$(nf-config --fflags)" --link-flag "$(nf-config --flibs)"
```

and

```
fpm run --flag "$(nf-config --fflags)" --link-flag "$(nf-config --flibs)"
```

### Step 5: Use in your fpm project!

In your Fortran code, simply use netcdf the same way you would use any other module:

```
use netcdf
```

Check out the code to see an example.

**TIP:** `ncdump` is part of the netcdf set of utilities. The command `ncdump -h [file.nc]` will let you examine the file header and read the variable names and dimensions.

