Welcome to the R package development workflow workshop!

To get started, navigate to the `R` folder, open the `01_gini_script.R` file, and 
review the code and comments.

Once you're done, follow the instructions below:  

1. Turn the script in `01_gini_script.R` into a function
2. Document your newly created function  
   * Hint: Use `Code` > `Insert Roxygen Skeleton`  
3. Test your function
   * Can you break it?
   * How can you prevent this?  
4. Use defensive programming to make your function more robust
   * Validate inputs
   * Provide helpful error message
   * Hint: Check [assertthat package](https://github.com/hadley/assertthat)
5. Implement unit tests
   * Is your code easy to unit test?
   * Do you see any potential for code re-factoring?
   * Hint: Check [testthat package](https://testthat.r-lib.org/)
6. Is your code well-tested?
   * Hint: Use `covr::report()` from [covr package](https://github.com/r-lib/covr)
