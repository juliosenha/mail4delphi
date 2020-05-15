# Mail4Delphi
![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-XE3..10.3%20Rio-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Win32%20and%20Win64-red.svg)

Mail4Delphi uses the Indy component to send the email.
 
## Prerequisites
* `[Required]` You need to have the libeay32.dll and ssleay32.dll dynamic library files. 

 * `[Optional]` For ease I recommend using the [**Boss**](https://github.com/HashLoad/boss) (Dependency Manager for Delphi) for installation, simply by running the command below on a terminal (Windows PowerShell for example):
```
boss install github.com/juliosenha/mail4delphi
```

## Manual Installation
If you choose to install manually, simply add the following folder to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*
```
../mail4delphi/src

```

## Samples
Check out our sample project for each situation presented above in operation. If you have any questions or suggestion, please contact, make your pull request or create an issue.

![Mail4Delphi](img/Screenshot_1.png)

> *Alone we go faster. Together we go further.*
