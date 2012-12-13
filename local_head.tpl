{if $load_css}
  {if $simple_conf.albumDisplay eq 'line'}
    {combine_css path="themes/simple/option_album_title_line.css" order=-10}
  {/if}
{/if}

{combine_script id='jquery.cookie' path='themes/simple/js/jquery.cookie.min.js'}
{combine_script id='simple.scripts' load='footer' require='jquery' path='themes/simple/js/scripts.js'}