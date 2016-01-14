# SYUKUR COMMON VIMRC

## Prerequisite
* Git application
* plug.vim manager
 - [Click Plugin Website](https://github.com/junegunn/vim-plug)


## Step by step
* Copy vimrc from repository to your local vimrc 
* Install Git application (skip if already installed)
* Install plug.vim manager (refer website on how to install)
* Open Vim then type :PlugInstall
* Compile YouCompleteMe
 - cd to YouCompleteMe folder
 - ./install.py --clang-completer

## Update
* Open Vim then type :PlugUpdate to update all
* Open Vim then type :PlugUpdate [module] to update sepcific module

## YouCompleteMe
* Require CMake to compile. (If not available)
* Require libpython, install libpython (if not available)
 - sudo apt-get install python-dev
