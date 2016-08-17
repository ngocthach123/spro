<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-news" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><span class="iconfa"><i class="fa fa-credit-card"></i></span> <?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li class="hidden"><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
						<li class="hidden"><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
						<li class="hidden"><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<ul class="nav nav-tabs" id="language">
								<?php foreach ($languages as $language) { ?>
								<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="news_description[<?php echo $language['language_id']; ?>][name]" onkeyup="locdau();" value="<?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
											<?php if (isset($error_name[$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
										<div class="col-sm-10">
											<input type="text" name="keyword" ondblclick="locdau();" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
										<div class="col-sm-10">
											<textarea name="news_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['description'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
										<div class="col-sm-10">
											<textarea name="news_description[<?php echo $language['language_id']; ?>][meta_description]" rows="1" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
										<div class="col-sm-10">
											<textarea name="news_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="1" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group hidden">
										<label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
										<div class="col-sm-10">
											<input type="text" name="news_tag[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($news_tag[$language['language_id']]) ? $news_tag[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
							<div class="tab-content">
								<div class="form-group hidden">
									<span><?php echo $entry_filename; ?></span>
									&nbsp;<input type="file" name="downloads" value="" />
									<br/>
									<span class="help" style="color: red;font-size: 14px;"><?php echo $filename; ?></span>
									<?php if ($error_download) { ?>
									<span class="error"><?php echo $error_download; ?></span>
									<?php } ?>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_cat; ?></label>
									<div class="col-sm-10">
										<div class="well well-sm" style="height: 150px; overflow: auto;">
											<?php foreach ($categories as $cat) { ?>
											<div class="checkbox">
												<label>
													<?php if (in_array($cat['cat_id'], $news_cat)) { ?>
													<input type="checkbox" name="news_cat[]" value="<?php echo $cat['cat_id']; ?>" checked="checked" />
													<?php echo $cat['name']; ?>
													<?php } else { ?>
													<input type="checkbox" name="news_cat[]" value="<?php echo $cat['cat_id']; ?>" />
													<?php echo $cat['name']; ?>
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
										<a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
									<div class="col-sm-10">
										<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
									</div>
								</div>
								<div class="form-group hidden">
									<div class="table-responsive">
										<table id="images" class="table table-striped table-hover">
											<thead>
												<tr>
													<td class="text-left"><?php echo $entry_additional_image; ?></td>
													<td class="text-right"><?php echo $entry_sort_order; ?></td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<?php $image_row = 0; ?>
												<?php foreach ($news_images as $news_image) { ?>
												<tr id="image-row<?php echo $image_row; ?>">
													<td class="text-left">
														<a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $news_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="news_image[<?php echo $image_row; ?>][image]" value="<?php echo $news_image['image']; ?>" id="input-image<?php echo $image_row; ?>" />
													</td>
													<td class="text-right">
														<input type="text" name="news_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $news_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
													</td>
												</tr>
												<?php $image_row++; ?>
												<?php } ?>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
												</tr>
											</tfoot>
										</table>
									</div>
								 </div>
								 <div class="form-group">
									<label class="col-sm-2 control-label" for="input-related"><?php echo $entry_related; ?></label>
									<div class="col-sm-10">
										<input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
										<div id="news-related" class="well well-sm" style="height: 150px; overflow: auto;">
											<?php foreach ($news_relateds as $news_related) { ?>
											<div id="news-related<?php echo $news_related['news_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $news_related['name']; ?>
												<input type="hidden" name="news_related[]" value="<?php echo $news_related['news_id']; ?>" />
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
									<div class="col-sm-3">
										<div class="input-group date">
											<input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
											<span class="input-group-btn">
											<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
									<div class="col-sm-10">
										<select name="status" id="input-status" class="form-control">
											<?php if ($status) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
									<div class="col-sm-10">
										<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
									</div>
								</div>
							</div>
							<!-- end tab data -->
						</div>
						<div class="tab-pane hidden" id="tab-links">
							<div class="form-group hidden">
								<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
								<div class="col-sm-10">
									<div class="well well-sm" style="height: 150px; overflow: auto;">
										<div class="checkbox">
											<label>
												<?php if (in_array(0, $news_store)) { ?>
												<input type="checkbox" name="news_store[]" value="0" checked="checked" />
												<?php echo $text_default; ?>
												<?php } else { ?>
												<input type="checkbox" name="news_store[]" value="0" />
												<?php echo $text_default; ?>
												<?php } ?>
											</label>
										</div>
										<?php foreach ($stores as $store) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($store['store_id'], $news_store)) { ?>
												<input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
												<?php echo $store['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" />
												<?php echo $store['name']; ?>
												<?php } ?>
											</label>
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane hidden" id="tab-design">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<td class="left"><?php echo $entry_store; ?></td>
											<td class="left"><?php echo $entry_layout; ?></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left"><?php echo $text_default; ?></td>
											<td class="text-left">
												<select name="news_layout[0]" class="form-control">
													<option value=""></option>
													<?php foreach ($layouts as $layout) { ?>
													<?php if (isset($news_layout[0]) && $news_layout[0] == $layout['layout_id']) { ?>
													<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</td>
										</tr>
										<?php foreach ($stores as $store) { ?>
										<tr>
											<td class="text-left"><?php echo $store['name']; ?></td>
											<td class="text-left">
												<select name="news_layout[<?php echo $store['store_id']; ?>]" class="form-control">
													<option value=""></option>
													<?php foreach ($layouts as $layout) { ?>
													<?php if (isset($news_layout[$store['store_id']]) && $news_layout[$store['store_id']] == $layout['layout_id']) { ?>
													<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</td>
										</tr>
										<?php } ?>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		<?php foreach ($languages as $language): ?>
		
		CKEDITOR.replace('input-description<?php echo $language['language_id']; ?>', {
			filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		});

		CKEDITOR.on('dialogDefinition', function (event)
		{
			var editor = event.editor;
			var dialogDefinition = event.data.definition;
			var dialogName = event.data.name;

			var tabCount = dialogDefinition.contents.length;
			for (var i = 0; i < tabCount; i++) {
				var browseButton = dialogDefinition.contents[i].get('browse');

				if (browseButton !== null) {
					browseButton.hidden = false;
					browseButton.onClick = function() {
						$('#modal-image').remove();
						$.ajax({
							url: 'index.php?route=common/filemanager&token=<?php echo $token; ?>&ckedialog='+this.filebrowser.target,
							dataType: 'html',
							success: function(html) {
								$('body').append('<div id="modal-image" style="z-index: 10020;" class="modal">' + html + '</div>');
								$('#modal-image').modal('show');
							}
						});
					}
				}
			}
		});

		<?php endforeach;?>
	</script>
	<script type='text/javascript'>
		function locdau() {
			var str = (document.getElementById("input-name2").value);// lấy chuỗi dữ liệu nhập vào từ form có tên title
			str= str.toLowerCase();// chuyển chuỗi sang chữ thường để xử lý
			/* tìm kiếm và thay thế tất cả các nguyên âm có dấu sang không dấu*/
			str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
			str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
			str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
			str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
			str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
			str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
			str= str.replace(/đ/g,"d");
			str= str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g,"-");
			/* tìm và thay thế các kí tự đặc biệt trong chuỗi sang kí tự - */
			str= str.replace(/-+-/g,"-"); //thay thế 2- thành 1-
			str= str.replace(/^\-+|\-+$/g,"");//cắt bỏ ký tự - ở đầu và cuối chuỗi
			document.getElementById("input-keyword").value = str;// xuất kết quả xữ lý ra keyword
		}
	</script>
	<script type="text/javascript"><!--
	$('input[name=\'related\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=content/news/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['news_id']
						}
					}));
				}
			});
			
		}, 
		'select': function(item) {
			
			$('input[name=\'related\']').val('');
			
			$('#news-related' + item['value']).remove();

			$('#news-related').append('<div id="news-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_related[]" value="' + item['value'] + '" /></div>');
					
		}
	});
	
	$('#news-related').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
	//--></script> 
	<script type="text/javascript"><!--
		var image_row = <?php echo $image_row; ?>;

		function addImage() {
			html  = '<tr id="image-row' + image_row + '">';
			html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="news_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
			html += '  <td class="text-right"><input type="text" name="news_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
			html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
			html += '</tr>';

			$('#images tbody').append(html);

			image_row++;
		}
	//--></script>
	<script type="text/javascript"><!--
		$('.date').datetimepicker({
			pickTime: false
		});

		$('.time').datetimepicker({
			pickDate: false
		});

		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true
		});
	//--></script>
	<script type="text/javascript"><!--
		$('#language a:first').tab('show');
	//--></script>
</div>
<?php echo $footer; ?>