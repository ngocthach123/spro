<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading hidden">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="well">
                        <form action="<?php echo $action;?>" method="post" id="form-shipping-cost">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <span><?php echo $entry_loai_hang; ?></span>
                                    <select name="loai_hang" class="">
                                        <option value="1" <?php echo $loai_hang == 1 ? 'selected' : '';?>>Thường</option>
                                        <option value="2" <?php echo $loai_hang == 2 ? 'selected' : '';?>>Đặc biệt</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <span><?php echo $entry_khoi_luong; ?></span>
                                    <input type="text" name="khoi_luong" value="<?php echo $khoi_luong;?>" class=""/>
                                    <span>(kg)</span>
                                </div>
                                <div class="form-group">
                                    <span><?php echo $entry_gia_don_hang; ?></span>
                                    <input type="text" name="gia_don_hang" value="<?php echo $gia_don_hang;?>" class=""/>
                                    <span>(vnd)</span>
                                </div>
                                <div class="form-group">
                                    <span><?php echo $entry_kich_thuoc; ?></span>
                                    <input type="text" name="dai" value="<?php echo $dai;?>" class="small-input"/> <span class="">(dài)</span>
                                    <input type="text" name="rong" value="<?php echo $rong;?>" class="small-input"/><span class="">(rộng)</span>
                                    <input type="text" name="cao" value="<?php echo $cao;?>" class="small-input" /> <span class="">(cao)</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <span><?php echo $entry_van_chuyen; ?></span>
                                    <select name="van_chuyen" class="">
                                        <option value="1" <?php echo $van_chuyen == 1 ? 'selected' : '';?>>Xe máy</option>
                                        <option value="2" <?php echo $van_chuyen == 2 ? 'selected' : '';?>>Oto</option>
                                        <option value="3" <?php echo $van_chuyen == 3 ? 'selected' : '';?>>Chành xe</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <span><?php echo $entry_gia_van_chuyen; ?></span>
                                    <input type="text" name="gia_van_chuyen" value="<?php echo $gia_van_chuyen;?>" class=""/><span>(vnd/1km)</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <span><?php echo $entry_hang; ?></span>
                                    <select name="hang_van_chuyen" class="">
                                        <option value="1" <?php echo $hang_van_chuyen == 1 ? 'selected' : '';?>>Giao hàng nhanh</option>
                                    </select>
                                </div>
                            </div>
                            <button class="btn btn-primary pull-right" style="margin-right: 45px; clear: both" type="submit">Lưu</button>
                            <div style="clear: both"></div>
                        </form>
                    </div>
                </div>

                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
                    <div class="table-responsive">
                        <table id="table-cost" class="table table-hover" border="1">
                            <thead>
                            <tr>
                                <td style="width: 1px;" class="text-center" rowspan="2"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                <td class="text-center" rowspan="2"><?php echo $column_stt; ?></td>
                                <td class="text-left" rowspan="2"><?php echo $column_loai_hang; ?></td>
                                <td class="text-left" rowspan="2"><?php echo $column_khoi_luong; ?></td>
                                <td class="text-left" rowspan="2"><?php echo $column_gia_don_hang; ?></td>
                                <td class="text-left" colspan="3">
                                  <?php echo $column_kich_thuoc; ?>
                                </td>
                                <td class="text-left" rowspan="2"><?php echo $column_van_chuyen; ?></td>
                                <td class="text-left" rowspan="2"><?php echo $column_gia_van_chuyen; ?></td>
                                <td class="text-left" rowspan="2"><?php echo $column_hang; ?></td>
                                <td class="text-right" rowspan="2"><?php echo $column_action; ?></td>
                            </tr>
                            <td>Dài</td><td>Rộng</td><td>Cao</td>
                            </thead>
                            <tbody>
                            <?php if ($costs) { ?>
                            <?php $i=1; foreach ($costs as $cost) { ?>
                            <tr>
                                <td class="text-center"><?php if (in_array($cost['cost_id'], $selected)) { ?>
                                    <input type="checkbox" name="selected[]" value="<?php echo $cost['cost_id']; ?>" checked="checked" />
                                    <?php } else { ?>
                                    <input type="checkbox" name="selected[]" value="<?php echo $cost['cost_id']; ?>" />
                                    <?php } ?></td>
                                <td class="text-left"><?php echo $i; ?></td>
                                <td class="text-left"><?php echo $cost['loai_hang']; ?></td>
                                <td class="text-left"><?php echo $cost['khoi_luong']; ?></td>
                                <td class="text-left"><?php echo $cost['gia_tri']; ?></td>
                                <td class="text-left"><?php echo $cost['dai']; ?></td>
                                <td class="text-left"><?php echo $cost['rong']; ?></td>
                                <td class="text-left"><?php echo $cost['cao']; ?></td>
                                <td class="text-left"><?php echo $cost['van_chuyen']; ?></td>
                                <td class="text-left"><?php echo $cost['gia_van_chuyen']; ?></td>
                                <td class="text-left"><?php echo $cost['hang_van_chuyen']; ?></td>
                                <td class="text-right"><a href="<?php echo $cost['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                            </tr>
                            <?php $i++; } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>