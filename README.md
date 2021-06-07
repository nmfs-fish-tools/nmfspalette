<!-- README.md is generated from README.Rmd. Please edit that file -->

# nmfspalette <a href={https:://nmfs-general-modeling-tools.github.io/nmfspalette}><img src="man/figures/logo.png" align="right" width=139 height=139 alt="logo with an image of a fish in multiple palette colors" />

an R color palette for `ggplot2` using NOAA Fisheries branding colors

![R-CMD-check](https://github.com/nmfs-general-modeling-tools/nmfspalette/workflows/R-CMD-check/badge.svg)

-----

This implements these
[steps](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2)
to create a `ggplot2` compatible palette according to NOAA Fisheries
branding.

## Installation

To install from Github use the following:

``` r
remotes::install_github("nmfs-general-modeling-tools/nmfspalette")
#> fansi (0.4.2 -> 0.5.0) [CRAN]
#> package 'fansi' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'fansi'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\~\R\win-library\4.0\00LOCK\fansi\libs\x64\fansi.dll to C:\~\R\win-
#> library\4.0\fansi\libs\x64\fansi.dll: Permission denied
#> Warning: restored 'fansi'
#> 
#> The downloaded binary packages are in
#>  C:\Users\chris\AppData\Local\Temp\RtmpIvMm0y\downloaded_packages
#>          checking for file 'C:\Users\chris\AppData\Local\Temp\RtmpIvMm0y\remotes50f04b495184\nmfs-general-modeling-tools-nmfspalette-5f53637/DESCRIPTION' ...  v  checking for file 'C:\Users\chris\AppData\Local\Temp\RtmpIvMm0y\remotes50f04b495184\nmfs-general-modeling-tools-nmfspalette-5f53637/DESCRIPTION' (389ms)
#>       -  preparing 'nmfspalette': (978ms)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'nmfspalette_0.0.0.9000.tar.gz'
#>      
#> 
library(nmfspalette)
```

## Contributing

We welcome contributions to `nmfspalette`. You are welcome to make any
changes you would like on a fork and submit a pull request. For more
substantial changes or to create a branch, please contact
<christine.stawitz@noaa.gov> (NOAA Affiliates only). We ask that all
contributors adhere to The NOAA Fisheries Integrated Toolbox [code of
conduct](https://github.com/nmfs-fish-tools/Resources/blob/master/CONTRIBUTING.md).

## Usage

Extract an interpolated color palette from the default “oceans” palette.
You can change the number of colors (10 shown below).

``` r
nmfspalette::nmfs_palette("oceans")(10)
#>  [1] "#0093D0" "#0085C6" "#0077BC" "#0069B2" "#005BA8" "#00539F" "#005097"
#>  [8] "#004C8F" "#004987" "#00467F"
```

## Palettes

To see the palettes, use the `display_nmfs_palette()` function.

### oceans

``` r
nmfspalette::display_nmfs_palette("oceans", 4)
```

![](man/figures/displ_oceans-1.png)<!-- -->

### waves

``` r
nmfspalette::display_nmfs_palette("waves", 4)
```

![](man/figures/displ_waves-1.png)<!-- -->

### seagrass

``` r
nmfspalette::display_nmfs_palette("seagrass", 4)
```

![](man/figures/displ_seagrass-1.png)<!-- -->

### urchin

``` r
nmfspalette::display_nmfs_palette("urchin", 4)
```

![](man/figures/displ_urchin-1.png)<!-- -->

### crustacean

``` r
nmfspalette::display_nmfs_palette("crustacean", 4)
```

![](man/figures/displ_crustacean-1.png)<!-- -->

### coral

``` r
nmfspalette::display_nmfs_palette("coral", 4)
```

![](man/figures/displ_coral-1.png)<!-- -->

### regional web (discrete)

``` r
nmfspalette::display_nmfs_palette("regional web", 6)
```

![](man/figures/displ_regional_web-1.png)<!-- -->

### secondary (discrete)

``` r
nmfspalette::display_nmfs_palette("secondary", 4)
```

![](man/figures/displ_secondary-1.png)<!-- -->

## Examples

In addition to `nmfs_palette` and `display_nmfs_palette` to get in-built
palettes, you can extract colors by name. Please see the NOAA Fisheries
Branding guide for color names, all spaces are replaced with underscores
in the color names.

``` r
nmfspalette::nmfs_cols("processblue")
#> processblue 
#>   "#0093D0"
```

To use the palettes with `ggplot2`, the `scale_color_nmfs()` and
`scale_fill_nmfs()` functions are provided. If no argument is given to
`scale_color_nmfs()`, a default (“oceans”) is used:

``` r
p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
     geom_point(size = 4) +
     scale_color_nmfs()
p
```

![](man/figures/default_plot-1.png)<!-- -->

`scale_fill_nmfs` does not have a default and therefore requires a named
argument for now, this is an example using the “crustacean” palette

``` r
ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density)) +
  scale_fill_nmfs(palette="crustacean", discrete=FALSE, reverse=TRUE)
```

![](man/figures/scale_fill_example-1.png)<!-- -->

-----

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is
provided on an ‘as is’ basis and the user assumes responsibility for its
use. DOC has relinquished control of the information and no longer has
responsibility to protect the integrity, confidentiality, or
availability of the information. Any claims against the Department of
Commerce stemming from the use of its GitHub project will be governed by
all applicable Federal law. Any reference to specific commercial
products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of Commerce.
The Department of Commerce seal and logo, or the seal and logo of a DOC
bureau, shall not be used in any manner to imply endorsement of any
commercial product or activity by DOC or the United States Government.”

  - This project code is made available through GitHub but is managed by
    NOAA at
    <https://vlab.ncep.noaa.gov/redmine/projects/integrated-fisheries-toolbox/files>

-----

<img src="pkgdown/figures/noaa-fisheries-rgb-2line-horizontal-small.png" width="75" />

[U.S. Department of Commerce](https://www.commerce.gov/) | [National
Oceanographic and Atmospheric Administration](https://www.noaa.gov) |
[NOAA Fisheries](https://www.fisheries.noaa.gov/)
