# LUT M.Sc. (Econ.) thesis template
LaTeX template for Master's Thesis at LUT School of Business and Management.

## Dependencies:
- MacTeX / MiKiTex / TeXLive etc.
- Perl 
    - Already installed on MacOS and Linux
    - Strawberry flavor is fine for Windows users
    - Running `perl --version` in terminal should print current version if Perl is installed correctly
 - latexmk (build system)
    - should be included in MacTeX and MiKiTeX
    - `latexmk --version` should print currently installed version to terminal if latexmk is installed properly
    - TeXLive and BasicTeX users might be lacking some dependencies
        - These can be installed  using GUI tool or by running `sudo tlmgr install <package>` in terminal
        - Possibly missing: `collection-fontsrecommended`, `csquotes`, `latexmk`, `placeins`, `lastpage`, `biber`


## Usage

Using text editor of choise, modify files to to your preference. `main.tex` serves as an entry point to the document, and PDF can be built by calling `latexmk -pdf -outdir=someoutputfolder main` in `/text` folder. 

> Visual Studio Code is recommended (free) for editing the files and building the PDF
> document on save. Installing the extension [LaTeX
> Workshop](https://github.com/James-Yu/LaTeX-Workshop) from author James Yu should do the
> trick. [Rewrap](https://github.com/stkb/Rewrap) is another solid extension for VS Code.
> 