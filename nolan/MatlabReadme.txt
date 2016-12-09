Getting started
---------------

The first thing you should do is make a copy of this distribution!
If you get a new computer, or lose a disk drive, you will be able 
to reinstall STABLE from the copy.

This file explains how to use the STABLE library for working with
stable distributions in matlab.  In step 1, use part (a) if your OS
is Windows, use part (b) for linux or Mac.

1. (a) for a Windows based system:
   Copy the files to a folder on your hard drive, say c:\stable.
   (i) If you have the files in a zip file, unzip it to the folder.
   (ii) If you have a CD with the uncompressed files, copy them
   to the folder.
   In either case, check that the files listed below are present.

   (b) for a linux or Mac system:
   Copy the files to a folder on your hard drive, say <home>\stable.
   (i) If you have the files in a zip file, unzip it to the folder.
   (ii) If you have a CD with the uncompressed files, copy them
   to the folder.
   In either case, check that the files listed below are present.

2. Start matlab.  Add the directory to your search path:
   (a) For newer versions of matlab (2013a and later):
   On the Home tab, look for the Set Path icon on the Environment
   toolbar. 
   (b) For older versions of matlab:   
   In the workplace window, select "File", then select "Set Path",
   then select "Add Folder".  
   
   In both cases (a) and (b), a window will pop-up that lets
   you select the folder where you put the toolbox from step 1.
   (This puts this folder in the search path permanently; you
   do not have to do this again.  If you move the toolbox or
   want to stop using it, you should remove the folder from the
   search path. If you install a new version of STABLE, then
   you must delete and reset these path variables or they will
   refer to the old version.)


3. Expand the Command window to full screen and start using the
   commands.  For example,
        x = -3:0.1:3;
        y = stablepdf(x,[1.5 0 1 0]);
        plot(x,y);
   will plot the density of a stable distribution with parameters
   theta=(alpha,beta,gamma,delta)=[1.5,0,1,0].  The program defaults
   to the 0-parameterization.

4. There are three .m files to test the functions in the STABLE
   library.  Use these scripts to test your installation.  Type
        stabletest
   to test univariate code,
        mvstabletest
   to test multivariate code, and   
        discretetest
   to test discrete stable code.


   You can open these files (stabletest.m, discretetest.m and
   mvstabletest.m respectively) to see how the commands are
   used. (You can do this within matlab, by going to the "File"
   menu at top left, clicking on "Open", and then selecting the
   file you want.  Remember to go to the folder where you put
   the STABLE code, e.g. c:\stable)  You can also open these   
   files with notepad or any other editor.

   WARNING: Do not change the supplied .m files, or STABLE
   may not work properly.  If you want to change something,
   copy the .m file to a different file name (or folder)
   and change the new copy.



Files in the STABLE distribution
--------------------------------

MatlabReadme.txt (this file)
LicenseAgreement.pdf (license to use the STABLE software)
UserManual.pdf (a formatted manual that describes the STABLE functions)
stablemex.mexw32 or stablemex.mexw64 or stablemex.mexglx or stablemex.mexa64
    or stablemex.mexmaci64 (platform specific mex file that contains the STABLE toolbox)
stable*.m      (matlab function definition files for univariate functions)
mvstable*.m    (matlab function definition files for multivariate functions)
discretetest.m (matlab script to test discrete stable functions)


Miscellaneous
-------------

matlab naming conventions for functions have been used:
   stablepdf to compute pdf
   stablecdf to compute cdf
   stableinv to compute inverse cdf (quantiles)
   stablernd to simulate stable random variates

All functions have a brief description in their .m file, which is
accessible by using the help command, e.g.
   help stablepdf
will describe the function to compute stable pdfs.  The User
Manual has more detail.

Error detection is basic.  Checks are done to guarantee that
legitimate values were passed to STABLE, but there may be unclear
error messages if incorrect values are used in a call to some
function.  (To see an error message, try using a value of alpha
outside the range (0,2], say y=stablepdf(x,[3 0 1 0]);)

The internal STABLE routines use 4 byte integer values for
arguments that take on discrete values (param, ierr, etc.)
while matlab uses reals for these variables.
When such a variable is an input value to some stablemex function,
it is rounded to the nearest integer.  When such a variable is an
output value, we convert it to double before returning to matlab.
If you use a non-integer input value, you may get unexpected
results.


(13 May 2014, support@robustanalysis.com)
