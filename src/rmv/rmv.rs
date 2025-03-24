// rmv.rs
// Maksim Yarovoy 24.03.2025
// NaGNU License

use std::env;
use std::fs::{self, File};
use std::io::{self, Write};
use std::path::{Path, PathBuf};
use std::process;
use std::collections::HashSet;
use std::ffi::OsString;

#[derive(Debug)]
enum RmError {
    Io(io::Error),
    InvalidInput,
    ConfirmationFailed,
}

impl From<io::Error> for RmError {
    fn from(err: io::Error) -> RmError {
        RmError::Io(err)
    }
}

fn print_error_and_exit(err: &RmError) {
    match err {
        RmError::Io(e) => eprintln!("error!: {}", e),
        RmError::InvalidInput => eprintln!("invalid input!"),
        RmError::ConfirmationFailed => eprintln!("confirmation failed!"),
    }
    process::exit(1);
}

fn prompt_confirmation(path: &Path) -> Result<bool, RmError> {
    let mut response = String::new();
    print!("remove '{}'? [y/N]: ", path.display());
    io::stdout().flush().map_err(RmError::Io)?;
    io::stdin().read_line(&mut response).map_err(RmError::Io)?;
    
    match response.trim().to_lowercase().as_str() {
        "y" => Ok(true),
        "yes" => Ok(true),
        _ => Ok(false),
    }
}

fn remove_file(path: &Path, force: bool, interactive: bool) -> Result<(), RmError> {
    if !force && interactive {
        if !prompt_confirmation(path)? {
            return Ok(());
        }
    }

    fs::remove_file(path).map_err(RmError::Io)?;
    println!("removed: {}", path.display());
    Ok(())
}

fn remove_dir(path: &Path, force: bool, interactive: bool) -> Result<(), RmError> {
    if !force && interactive {
        if !prompt_confirmation(path)? {
            return Ok(());
        }
    }

    fs::remove_dir_all(path).map_err(RmError::Io)?;
    println!("! removed: {}", path.display());
    Ok(())
}

fn remove(paths: Vec<PathBuf>, force: bool, interactive: bool) -> Result<(), RmError> {
    let mut seen: HashSet<PathBuf> = HashSet::new();

    for path in paths {
        if seen.contains(&path) {
            continue;
        }

        seen.insert(path.clone());

        if path.is_dir() {
            remove_dir(&path, force, interactive)?;
        } else {
            remove_file(&path, force, interactive)?;
        }
    }

    Ok(())
}

fn parse_args() -> Result<(Vec<PathBuf>, bool, bool), RmError> {
    let args: Vec<OsString> = env::args_os().collect();
    let mut force = false;
    let mut interactive = false;
    let mut paths: Vec<PathBuf> = Vec::new();

    for arg in args.iter().skip(1) {
        match arg.to_str() {
            Some("-f") | Some("--force") => force = true,
            Some("-i") | Some("--interactive") => interactive = true,
            Some(path) => paths.push(Path::new(path).to_path_buf()),
            None => return Err(RmError::InvalidInput),
        }
    }

    if paths.is_empty() {
        return Err(RmError::InvalidInput);
    }

    Ok((paths, force, interactive))
}

fn main() {
    match parse_args() {
        Ok((paths, force, interactive)) => {
            if let Err(e) = remove(paths, force, interactive) {
                print_error_and_exit(&e);
            }
        }
        Err(e) => print_error_and_exit(&e),
    }
}

