AliceOS
======

AliceOS is a simple operating system for ARM processors. I create it for
demonstrate some operating system related introductions.

Basically, I will combine the introductions in my blog: https://silentming.net
when I implement the OS.

Hardware Support
----------------

This is mainly developed for qemu but to make it available on practical hardware,
I will try to make it support [raspberrypi2](raspberrypi) since qemu could emulate
it.

Current Status
--------------

Just Start.

Compiling
---------

You need to install the GNU tools for cross-compilation for arm-none-eabi target
to be able to compile the code. To install these tools in MacOS, you can do:

```sh
brew tap PX4/homebrew-px4
brew install gcc-arm-none-eabi
```

To run it on qemu (host on MacOS), you need to install qemu as well:

```sh
brew install qemu
```

To build the OS, run

```
make
```

The default arch is vexpress-a9. The kernel image is "alice.bin".

License
-------

This software is BSD licensed. For more details, see the LICENSE file.

Reference
-------
