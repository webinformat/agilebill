{$list->unserial($host_server.provision_plugin_data, "plugin_data")}
 
<table width="100%" border="0" cellspacing="3" cellpadding="1" class="row1">
  <tr valign="top"> 
    <td width="50%"> 
      {translate module=host_server}
      field_keycode 
      {/translate}
    </td>
    <td width="50%"> 
      <input type="text" name="host_server_keycode" value="{$host_server.keycode}" class="form_field" size="40" maxlength="64">
    </td>
  </tr>
</table>
 
<table width="100%" border="0" cellspacing="2" cellpadding="3" class="row1">
  <tr> 
    <td><p>To complete the automation for this server with the selected provisioning 
        plugin, you must paste the text in the box below and save it as a .sh file 
        on the target server in the directory where the following executable files are located. (generally '/usr/libexec/webmin/virtual-server/')</p>
      <pre wrap="">create-domain.pl<br>delete-domain.pl<br>disable-domain.pl<br>enable-domain.pl<br>edit-domain.pl</pre>
      <p>You must 
          then give the .sh file you have created proper permission to execute the 
          above mentioned files (root), and create a crontab job that runs it every 2-3 minutes to keep changes on the server up to date.
        <br>
        <br>
        You must also have curl installed on the machine where the .sh file will be copied, and make sure the correct path to the 
      curl directory is reflected in the 1st line of your .sh file below...</p></td>
  </tr>
  <tr>
    <td> 
      <div align="center">
        <textarea name="textfield" cols="60" rows="8" class="form_field">CURL=/usr/bin/curl
KEY={$host_server.keycode}
PLG={$host_server.provision_plugin}
URL={$URL}plugins/provision/

{literal}${CURL} -d "key=${KEY}" ${URL}${PLG}.php > provision_output.sh{/literal}
sh provision_output.sh
rm provision_output.sh

</textarea>
      </div>
    </td>
  </tr>
</table>
