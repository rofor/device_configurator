# Device Configurator

This script was created to help configure multiple network devices with various parameters contained within a single CSV file.

Each line in the CSV file represents a pysical device which needs configuring, with each non-empty cell containing a value we wish to add to a configuration file. 

The script reads each line of the CSV file, and assigns each value on that line to a variable. It then copies an existing configuration template with a name which matches the device variable, and then populates it with the configuration variables, before moving
to the next line and repeating the process. 

The result is a custom configuration file for each line in the CSV file.
