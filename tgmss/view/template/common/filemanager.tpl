<div class="modal-dialog modal-lg">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title"><?php echo $heading_title; ?></h4>
    </div>
    <div class="modal-body">
      <div class="row">
        <div class="col-sm-5"><a href="<?php echo $parent; ?>" data-toggle="tooltip" title="<?php echo $button_parent; ?>" id="button-parent" class="btn btn-default"><i class="fa fa-level-up"></i></a>
            <a href="<?php echo $refresh; ?>" data-toggle="tooltip" title="<?php echo $button_refresh; ?>" id="button-refresh" class="btn btn-default"><i class="fa fa-refresh"></i></a>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_upload; ?>" id="button-upload" class="btn btn-primary"><i class="fa fa-upload"></i></button>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_folder; ?>" id="button-folder" class="btn btn-default"><i class="fa fa-folder"></i></button>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" id="button-delete" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
		  <button type="button" data-toggle="tooltip" title="<?php echo 'Add to image tab'; ?>" id="button-moveimage" class="btn btn-default"><i class="fa fa-file-image-o"></i></button>
        </div>
        <div class="col-sm-7">
          <div class="input-group">
            <input type="text" name="search" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_search; ?>" class="form-control">
            <span class="input-group-btn">
            <button type="button" data-toggle="tooltip" title="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary"><i class="fa fa-search"></i></button>
            </span></div>
        </div>
      </div>
      <hr />
      <?php foreach (array_chunk($images, 4) as $image) { ?>
      <div class="row">
        <?php foreach ($image as $image) { ?>
        <div class="col-sm-3 text-center">
          <?php if ($image['type'] == 'directory') { ?>
          <div class="text-center"><a href="<?php echo $image['href']; ?>" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>
          <label>
            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
            <?php echo $image['name']; ?></label>
          <?php } ?>
          <?php if ($image['type'] == 'image') { ?>
          <a href="<?php echo $image['href']; ?>" class="thumbnail"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['name']; ?>" title="<?php echo $image['name']; ?>" /></a>
          <label>
            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
            <?php echo $image['name']; ?></label>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <br />
      <?php } ?>
    </div>
    <div class="modal-footer"><?php echo $pagination; ?></div>
  </div>
</div>
<script type="text/javascript"><!--
<?php if ($target) { ?>
//
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD (Register as an anonymous module)
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // Node/CommonJS
        module.exports = factory(require('jquery'));
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($) {

    var pluses = /\+/g;

    function encode(s) {
        return config.raw ? s : encodeURIComponent(s);
    }

    function decode(s) {
        return config.raw ? s : decodeURIComponent(s);
    }

    function stringifyCookieValue(value) {
        return encode(config.json ? JSON.stringify(value) : String(value));
    }

    function parseCookieValue(s) {
        if (s.indexOf('"') === 0) {
            // This is a quoted cookie as according to RFC2068, unescape...
            s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
        }

        try {
            // Replace server-side written pluses with spaces.
            // If we can't decode the cookie, ignore it, it's unusable.
            // If we can't parse the cookie, ignore it, it's unusable.
            s = decodeURIComponent(s.replace(pluses, ' '));
            return config.json ? JSON.parse(s) : s;
        } catch(e) {}
    }

    function read(s, converter) {
        var value = config.raw ? s : parseCookieValue(s);
        return $.isFunction(converter) ? converter(value) : value;
    }

    var config = $.cookie = function (key, value, options) {

        // Write

        if (arguments.length > 1 && !$.isFunction(value)) {
            options = $.extend({}, config.defaults, options);

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setMilliseconds(t.getMilliseconds() + days * 864e+5);
            }

            return (document.cookie = [
                encode(key), '=', stringifyCookieValue(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path    ? '; path=' + options.path : '',
                options.domain  ? '; domain=' + options.domain : '',
                options.secure  ? '; secure' : ''
            ].join(''));
        }

        // Read

        var result = key ? undefined : {},
            // To prevent the for loop in the first place assign an empty array
            // in case there are no cookies at all. Also prevents odd result when
            // calling $.cookie().
            cookies = document.cookie ? document.cookie.split('; ') : [],
            i = 0,
            l = cookies.length;

        for (; i < l; i++) {
            var parts = cookies[i].split('='),
                name = decode(parts.shift()),
                cookie = parts.join('=');

            if (key === name) {
                // If second argument (value) is a function it's a converter...
                result = read(cookie, value);
                break;
            }

            // Prevent storing a cookie that we couldn't decode.
            if (!key && (cookie = read(cookie)) !== undefined) {
                result[name] = cookie;
            }
        }

        return result;
    };

    config.defaults = {};

    $.removeCookie = function (key, options) {
        // Must not alter options, thus extending a fresh object...
        $.cookie(key, '', $.extend({}, options, { expires: -1 }));
        return !$.cookie(key);
    };

}));

//$(document).ready(function() {
//    var c2_directory_url = decodeURIComponent($.cookie('c2_directory'));
//    var c2_cur_url = decodeURIComponent('<?php echo $directory; ?>');
//
//    //debugger;
//
//    if (c2_cur_url.length === 0) c2_cur_url = '/';
//    if (c2_directory_url === "undefined") c2_directory_url = c2_cur_url;
//
//    if (c2_cur_url.indexOf(c2_directory_url) === -1 && c2_directory_url.length !== 0 ) {
//        $('#modal-image').load(''.concat('index.php?route=common/filemanager&token=<?php echo $token; ?>&directory=', encodeURIComponent(c2_directory_url), '&target=<?php echo $target; ?>&thumb=<?php echo $thumb; ?>'));
//    }
//});

// Move image to Imagw folder
$('#button-moveimage').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();

    var cnt = 0 ;

    $.each($('div.modal-content').find('input[type="checkbox"]'), function(){
        if ( $(this).prop('checked') === true && $(this).val() != 'on') {
            var img_el = $(this).parent().parent().find('img').first();
        
            var image_id = parent.image_row; // row index
            parent.addImage(); // add row in image Tab
            var cur_block = $('#image-row'.concat(image_id)); // Added block
    
            parent.$('#thumb-image' + image_id + ' > img ').attr('src', $(img_el).attr('src'));
            parent.$('#input-image' + image_id ).val( $(this).attr('value') );
            cnt++;
        }
    });

    if (cnt > 0) {
        $('#modal-image').modal('hide');
        parent.$('a[href="#tab-image"]').trigger('click');
    } else {
        alert('Select image files to add it.');
    }
});

$('a.thumbnail').on('click', function(e) {
	e.preventDefault();

	<?php if ($thumb) { ?>
	$('#<?php echo $thumb; ?>').find('img').attr('src', $(this).find('img').attr('src'));
	<?php } ?>

	$('#<?php echo $target; ?>').attr('value', $(this).parent().find('input').attr('value'));

	//ocm_CKeditorIsBack_start
	<?php if ($ckedialog) { ?>
		dialog = CKEDITOR.dialog.getCurrent();
			var targetElement = '<?php echo $ckedialog; ?>' || null;
    var target = targetElement.split( ':' );
    dialog.setValueOf( target[ 0 ], target[ 1 ], this.getAttribute('href') );
	<?php } ?>
//ocm_CKeditorIsBack_end

	$('#modal-image').modal('hide');
});
    <?php } elseif ($ckedialog) { ?>
        $('a.thumbnail').on('click', function(e) {
            e.preventDefault();
            dialog = CKEDITOR.dialog.getCurrent();
            var targetElement = '<?php echo $ckedialog; ?>' || null;
            var target = targetElement.split( ':' );
            dialog.setValueOf( target[ 0 ], target[ 1 ], this.getAttribute('href') );
            $('#modal-image').modal('hide');
        });
//ocm_CKeditorIsBack_end
        <?php } ?>

$('a.directory').on('click', function(e) {
    e.preventDefault();

//    var c2_url = $(this).attr('href');
//    var c2_find_start  = c2_url.indexOf('&directory=');
//    var c2_find_finish = c2_url.indexOf('&target=');
//
//    if ( c2_find_start !== -1 ) {
//        c2_find_start = parseInt(c2_find_start)+11;
//        c2_find_finish = parseInt(c2_find_finish);
//        $.cookie('c2_directory', ''.concat(c2_url.substring(c2_find_start,c2_find_finish)) , { expires: 1} );
//    }

	$('#modal-image').load($(this).attr('href'));
});

$('.pagination a').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('#button-parent').on('click', function(e) {
    e.preventDefault();

    var c2_url = $(this).attr('href');

    var c2_find_start  = c2_url.indexOf('&directory=');
    var c2_find_finish = c2_url.indexOf('&target=');
    
    if ( c2_find_start !== -1 ) {
        c2_find_start = parseInt(c2_find_start)+11;
        c2_find_finish = parseInt(c2_find_finish);
        $.cookie('c2_directory', ''.concat(c2_url.substring(c2_find_start,c2_find_finish)) , { expires: 1} );
    } else {
        $.cookie('c2_directory', '/' , { expires: 1} );
    }

	$('#modal-image').load($(this).attr('href'));
});

$('#button-refresh').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('input[name=\'search\']').on('keydown', function(e) {
	if (e.which == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').on('click', function(e) {
	var url = 'index.php?route=common/filemanager&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>';

	var filter_name = $('input[name=\'search\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	<?php if ($thumb) { ?>
	url += '&thumb=' + '<?php echo $thumb; ?>';
	<?php } ?>

	<?php if ($target) { ?>
	url += '&target=' + '<?php echo $target; ?>';
	<?php } ?>

    //ocm_CKeditorIsBack_start
    <?php if ($ckedialog) { ?>
        url += '&ckedialog=' + '<?php echo $ckedialog; ?>';
        <?php } ?>
    //ocm_CKeditorIsBack_end

	$('#modal-image').load(url);
});
//--></script>
<script type="text/javascript"><!--
$('#button-upload').on('click', function() {
	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input id="multiple_upload_file" type="file" multiple name="file[]" value="" /></form>');

	$('#form-upload input#multiple_upload_file').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input#multiple_upload_file').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=common/filemanager/upload&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>&product_name=<?php echo $product_name; ?>&product_id=<?php echo $product_id; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-upload').prop('disabled', true);
				},
				complete: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-upload').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}

					if (json['success']) {
						alert(json['success']);

						$('#button-refresh').trigger('click');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$('#button-folder').popover({
	html: true,
	placement: 'bottom',
	trigger: 'click',
	title: '<?php echo $entry_folder; ?>',
	content: function() {
		html  = '<div class="input-group">';
		html += '  <input type="text" name="folder" value="" placeholder="<?php echo $entry_folder; ?>" class="form-control">';
		html += '  <span class="input-group-btn"><button type="button" title="<?php echo $button_folder; ?>" id="button-create" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
		html += '</div>';

		return html;
	}
});

$('#button-folder').on('shown.bs.popover', function() {
	$('#button-create').on('click', function() {
		$.ajax({
			url: 'index.php?route=common/filemanager/folder&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>&product_name=<?php echo $product_name; ?>&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
			beforeSend: function() {
				$('#button-create').prop('disabled', true);
			},
			complete: function() {
				$('#button-create').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					alert(json['error']);
				}

				if (json['success']) {
					alert(json['success']);

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

$('#modal-image #button-delete').on('click', function(e) {
	if (confirm('<?php echo $text_confirm; ?>')) {
		$.ajax({
			url: 'index.php?route=common/filemanager/delete&token=<?php echo $token; ?>&product_name=<?php echo $product_name; ?>&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $('input[name^=\'path\']:checked'),
			beforeSend: function() {
				$('#button-delete').prop('disabled', true);
			},
			complete: function() {
				$('#button-delete').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					alert(json['error']);
				}

				if (json['success']) {
					alert(json['success']);

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
});
//--></script>
