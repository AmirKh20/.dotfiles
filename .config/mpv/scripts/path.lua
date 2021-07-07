-- write the working-directory to the /tmp/path_file for downloading and extracting subtitles from qutebrowser with subtitle script
function get_working_directory()
    local path = mp.get_property("working-directory")
    os.execute("echo '" .. path .. "' > " .. "/tmp/path_file")
    mp.osd_message("path copied into /tmp/path_file", 10)
end
mp.add_key_binding('ctrl+p', 'get_working_directory', get_working_directory)
