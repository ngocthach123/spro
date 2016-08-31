<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div id="content" class="col-md-7 wrap-contact"><?php echo $content_top; ?>
      <h1 class="block block-title"><?php echo $text_contact; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal btruongdangky">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-9">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-9">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"/>
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-9">
              <textarea name="enquiry" rows="10" id="input-enquiry" ><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn-orange" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <div class="col-md-5">
      <div class="wrap-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.7478215126966!2d106.70291973180417!3d10.830600594843208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175288a1f38364d%3A0x163793f46c963b6b!2zQ8O0bmcgVHkgTmFtIFZp4buHdA!5e0!3m2!1svi!2s!4v1472636341865" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>
      <?php echo $column_right; ?>

    </div>
 </div>
</div>
<?php echo $footer; ?>
