{if !empty($thumbnails)}{strip}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{*define_derivative name='derivative_params' width=160 height=90 crop=true*}
{html_style}
{*Set some sizes according to maximum thumbnail width and height*}
.thumbnails SPAN,
.thumbnails .wrap2 A,
.thumbnails LABEL{ldelim}
	width: {$derivative_params->max_width()+2}px;
}

.thumbnails .wrap2{ldelim}
	height: {$derivative_params->max_height()+3}px;
}
{if $derivative_params->max_width() > 600}
.thumbLegend {ldelim}font-size: 130%}
{else}
{if $derivative_params->max_width() > 400}
.thumbLegend {ldelim}font-size: 110%}
{else}
.thumbLegend {ldelim}font-size: 90%}
{/if}
{/if}
{/html_style}
<ul>
  {foreach from=$thumbnails item=thumbnail}
    {assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
  <li>
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" {if !$derivative->is_cached()}data-{/if}src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}">
    </a>
    {if $SHOW_THUMBNAIL_CAPTION }
    <p>
      {if isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}
  	  {if !empty($thumbnail.icon_ts)}
	  <img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" class="icon" alt="(!)">
	  {/if}
      {if isset($thumbnail.NB_COMMENTS)}
      <span class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
        ({$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)})
      </span>
      {/if}
    </p>
    {/if}
  </li>
{/foreach}{/strip}
</ul>
{/if}
