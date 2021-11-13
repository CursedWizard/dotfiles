function toaac
    ffmpeg -i $argv[1] -acodec copy "$argv[2].aac"
end

function vpn_connect
    openvpn --config es-bcn.prod.surfshark.com_udp.ovpn --auth-user-pass aa_pass.txt
end

function mime_def
  if test "$argv[1]" = ""
    echo "No app name provided (first argument)"
    return
  end

  if test "$argv[2]" = ""
    echo "No file provided (second argument)"
    return
  end

  set potential_app_name (fd $argv[1] /usr/share/applications/)

  # no such app found with specified name
  if test "$potential_app_name" = ""
    echo "No app named $argv[1] found in /usr/share/applications/"
    return
  end

  # check if the file exists
  if test -e $argv[2]
    # get filetype like application/pdf
    set filetype (xdg-mime query filetype $argv[2])
  else
    echo "File $argv[2] doesn't exist"
    return
  end

  set app_name $potential_app_name

  # if there's more than 1 names matching choose only one
  if test (count $potential_app_name) -gt 1
    # get path of the app name with .desktop extension
    set app_name (printf '%s\n' $potential_app_name | fzf)
  end

  # dont' use absolute path
  set app_name (basename $app_name)

  echo "Applications of type \"$filetype\" now will be opened with \"$app_name\". Saved to /home/funtik/.config/mimeapps.list"

  xdg-mime default $app_name $filetype
end
