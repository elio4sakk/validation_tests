# validation_tests: R Package tests for the validation platform

### Tests

The tests themselves are stored in package-specific directories in `tests`.

### Datasets

Some datasets that are necessary for the tests are stored in `datasets`, together with any code necessary for generating them. 

Datasets and the generating code should be stored with the same name, with different extensions, i.e. `demo.R` for the code and `demo.csv` for the dataset itself.

Data may also be generated in the `test-function.R` or `setup-package.R` files if they are not of general interest for testing multiple packages.
