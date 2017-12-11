# Rätsel
[![Coverage Status](https://coveralls.io/repos/github/vynessa/ratsel/badge.svg?branch=develop)](https://coveralls.io/github/vynessa/ratsel?branch=develop)
[![Gem Version](https://badge.fury.io/rb/ratsel.svg)](https://badge.fury.io/rb/ratsel)
[![Build Status](https://travis-ci.org/vynessa/ratsel.svg?branch=develop)](https://travis-ci.org/vynessa/ratsel)

## Introduction
Rätsel is German for `Enigma`. Rätsel is an encryption tool that can take in messages, encrypt them for transmission, then decrypt messages we get from others.

### Features
<ul>
<li>Messages can be encrypted</li>
<li>Encrypted messages can be decrypted provided the encyption key and date are passed in</li>
<li>Encrypted messages can be cracked without the encryption key</li>
</ul>

## Getting started with the project
* Visit the [Wiki](https://github.com/vynessa/ratsel/wiki/Getting-Started-with-the-Project) to find out how to make use of this project.

## How to use the application
To utilize the functionality of this tool, on command line, run the following:
* To encrypt, run `encrypt <file> [<output>]`
* To decrypt, run `decrypt <encrypted-file> [<output>] <key> <date>`
* To crack, run `crack <encrypted-file> [<output>] <date>`

## Sample Encryption and Decryption
* Suppose we have a text file in a lib directory `test.txt` with the content below:
    ```hello hello ..end..```
* On running encrypt with our output as `new.txt`
    ```encrypt lib/test.txt lib/new.txt```
* The result will be 
    ```6a43a6zv h7ow7w527q```
* Running decrypt and passing the output file, encryption key and date, we will then have:
    ```hello hello ..end..```

## Naming conventions
* Visit the [Wiki](https://github.com/vynessa/ratsel/wiki) to find branch, commit messages and pull request naming conventions.
## Contributing to the project
* Fork this repository to your github account
* Clone the repository -  `git clone https://github.com/<your-repo-name>/ratsel.git`
* Create your feature branch - `git checkout -b your-branch-name`
* Commit your changes - `git commit -m “[Enter message]“` or `git commit` for the interactive interface
* Push to the remote branch - `git push origin your-branch-name`
* Open a pull request (See [wiki](https://github.com/vynessa/ratsel/wiki/Pull-Request-Naming-and-Description-Convention) for pull request(s) naming convention)
I look forward to your pull requests!

## License
[MIT License](https://github.com/vynessa/ratsel/blob/develop/LICENSE)

## Author
* **[Vanessa Ejikeme](https://www.linkedin.com/in/vanessa-ejikeme-68078b74/)**