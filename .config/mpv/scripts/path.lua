-- write the working-directory to the /tmp/path_file for downloading and extracting subtitles from qutebrowser with subtitle script
function get_working_directory()
    local path = mp.get_property("working-directory")
    file = io.open("/tmp/path_file", "w")
    file:write(path)
    file:close()
    mp.osd_message("path copied into /tmp/path_file", 10)
end
mp.add_key_binding('ctrl+s', 'get_working_directory', get_working_directory)
