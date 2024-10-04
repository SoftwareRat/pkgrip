# pkgrip

**Fast Linux Alternative for Decrypting PS3/PSP PKGs**

Developed originally by **qwikrazor87**, pkgrip is a powerful PC application designed to decrypt PSP/PS3 package files (PKGs). It supports extracting **PS1 KEYS.BIN** and decrypting **PTF themes**.

## Overview

The primary goal of pkgrip is to provide a native and faster alternative for dumping PKG files on Linux. Unlike most other PKG decrypters that first dump the decrypted PKG to a file before extracting the contents, pkgrip directly extracts the files from the PKG using a small buffer. The process is as follows:

```
pkg -> buffer -> extracted files
```

In contrast, other apps typically follow this sequence:

```
pkg -> buffer -> decrypted pkg -> buffer -> extracted files
```

## Features

- **Direct Extraction**: Extracts files directly from PKGs without intermediate steps.
- **Support for KEYS.BIN**: Extracts PS1 KEYS.BIN files.
- **PTF Theme Decryption**: Supports decryption of PTF themes.

## Usage

To use pkgrip, run the following command in your terminal:

pkgrip [options] <path_to_pkg>

### Options

| Option | Description |
|--------|-------------|
| `-psp` | Extract PSP files only |
| `-ps3` | Extract PS3 files only |

### Examples

1. Extract all files from a PKG:

   pkgrip /path/to/game.pkg

2. Extract only PSP files:

   pkgrip -psp /path/to/psp_game.pkg

3. Extract only PS3 files:

   pkgrip -ps3 /path/to/ps3_game.pkg

Note: If no options are provided, pkgrip will extract both PSP and PS3 files by default.

### Tips

- Use quotes around the path if it contains spaces: `pkgrip "/path/with spaces/game.pkg"`
- For batch processing, you can use wildcards: `pkgrip /path/to/pkgs/*.pkg`
- Check the console output for any errors or warnings during the extraction process

## Installation

To install pkgrip, clone the repository and compile it:

```bash
git clone https://github.com/qwikrazor87/pkgrip.git
cd pkgrip
make
```

## Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the GNU General Public License v3.0 (GPLv3). See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

Thanks to everyone who has contributed to this project and to the community for their support!

## Maintainer
This project is actively maintained by **SoftwareRat**. For any inquiries or support, please feel free to reach out.
