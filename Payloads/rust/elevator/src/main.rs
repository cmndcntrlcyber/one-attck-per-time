use std::process;
use winapi::um::wincon::{ShowWindow, SW_SHOW};
use winapi::um::shellapi::{ShellExecuteW};
const SEE_MASK_NOCLOSEPROCESS: u32 = 0x0040;
const SEE_MASK_WAITFORINPUTIDLE: u32 = 0x00080;
use winapi::um::winuser::{WM_CLOSE, DestroyWindow, GetForegroundWindow, SetForegroundWindow, WS_MINIMIZE, WS_MAXIMIZE, WS_VISIBLE, WS_SIZEBOX, WS_EX_OVERLAPPEDWINDOW};
use winapi::um::winnt::{PROCESS_ALL_ACCESS, PROCESS_QUERY_INFORMATION};

fn main() {
    let h_current_process = GetCurrentProcess();
    let mut h_token: u32 = 0;
    unsafe { OpenProcessToken(h_current_process, TOKEN_RIGHTS::TOKEN_IMPERSONATE | TOKEN_RIGHTS::TOKEN_DUPLICATE | TOKEN_RIGHTS::TOKEN_READ, &mut h_token) };

    let mut current_token_info = std::mem::zeroed();
    unsafe { GetTokenInformation(h_token, winapi::um::securitybaseapi::TokenInformationClass::TokenUser, &mut current_token_info as *mut _ as _) };

    unsafe { AdjustTokenPrivileges(
        h_token,
        false,
        1,
        &SE_AUTHENTICITY_REQUIRED,
        std::ptr::null_mut(),
        &mut current_token_info.TokenUser.dwLength as _
    ) };

    let mut new_token: u32 = 0;
    unsafe { ReplaceProcessLevelToken(h_current_process, TOKEN_ALL_ACCESS, &h_token) };

    unsafe { ShellExecuteW(None, None, "powershell.exe", Some(""), None, SW_SHOW) };
}