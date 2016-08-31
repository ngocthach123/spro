<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-login">
          <div class="bdangnhapfacebook">
            <h1>Đăng nhập email hoặc tài khoản facbook</h1>
            <div class="btruongdangnhap well">
              <div class="dangnhapemail">
                <span>Địa chỉ Email:</span><br>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="" id="input-email" /><br>
                <span>Mật khẩu:</span><br>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="" id="input-password"/><br>
                <a class="btndangnhapemail" onclick="document.getElementById('form-login').submit();">Tiếp tục</a><br>
                <a href="<?php echo $forgotten; ?>" class="forgetpass"><?php echo $text_forgotten; ?></a>
              </div>
              <div class="dangnhapfacebook">
                <h3>Đăng nhập bằng tài khoản mạng xã hội</h3>
                <p>Spro cam kết không bao giờ gửi bài viết hay chia sẻ thông tin khi chưa được sự đồng ý của bạn</p>
                <a href="Javascript:newPopup('<?php echo $fb_login;?>')" class="btndangnhapfacebook"><i class="fa fa-facebook"></i> &nbsp;&nbsp;&nbsp;Sign in with Facebook</a>
              </div>
            </div>
          </div>
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </form>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
  // Popup window code
  function newPopup(url) {
    popupWindow = window.open(
            url,'popUpWindow','height=420,width=500,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
  }
</script>


<?php echo $footer; ?>