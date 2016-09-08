<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div class="vmax-colum-left col-lg-3 col-md-3"><div class="vmax-filter sidebar sidebar-main">
        <div id="sidebar" class="vmax-blog-search">
          <div class="widget block">
            <h3 class="block block-title">Tìm kiếm bài viết</h3>
            <div class="block-content">
              <form class="form minisearch" action="<?php echo $action_search;?>" method="get">
                <div class="field search">
                  <div class="control">
                    <div class="input-group">
                      <input id="search_blog" type="text" name="filter_name" value="" class="form-control" aria-haspopup="false" maxlength="128" role="combobox" placeholder="Tìm kiếm bài viết..." aria-autocomplete="both" autocomplete="off">
                            <span class="input-group-btn">
                                <button class="action search" type="submit">
                                  <i class="fa fa-search" aria-hidden="true"></i> </button>
                            </span>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div id="sidebar" class="vmax-blog-category">
          <?php echo $categories;?>
        </div>

        <?php if ($articles_lasted): ?>
        <div id="sidebar" class="vmax-blog-latest">
          <div class="widget widget_latest block">
            <h3 class="block block-title">Bài viết mới</h3>
            <ul>
              <?php foreach ($articles_lasted as $article): ?>
              <li class="cat-item">
                <a href="<?php echo $article['href']; ?>">
                  <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>">
                  <?php echo $article['name']; ?></a>
              </li>
              <?php endforeach;?>
            </ul>
          </div>
        </div>
        <?php endif;?>

        <?php if ($articles): ?>
          <div id="sidebar" class="vmax-blog-popular">
            <div class="widget widget_popular block">
              <h3 class="block block-title"><?php echo $text_related; ?></h3>
              <ul>
                <?php foreach ($articles as $article): ?>
                  <li class="cat-item">
                    <a href="<?php echo $article['href']; ?>">
                      <img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" >
                      <strong><?php echo $article['name']; ?></strong>
                    </a>
                  </li>
                <?php endforeach;?>
              </ul></div>
          </div>
        <?php endif;?>

      </div>
    </div>

    <div id="content" class="col-md-9"><?php echo $content_top; ?>
      <div class="row">
        <div class="wrap-article">
          <h1 class="block block-title"><?php echo $heading_title; ?></h1>
          <div class="article-info">
            <span><?php echo $date_added;?> - <?php echo $author;?> </span>
          </div>
          <?php echo $description; ?>

          <div class="headnhanxet head-article">
            <p class="titheading-allpage">Nhận xét về bài viết</p>
          </div>

          <div class="box-write-comment">
            <div class="vietdanhgia">
              <a class="vnx" data-toggle="modal" data-target="#myModal">
                Viết nhận xét của bạn
              </a>
            </div>
          </div> <div style="clear: both"></div>

          <!-- Modal -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <form id="form-review">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modaldanhgia" id="myModalLabel">Chúng tôi muốn nhận được những nhận xét khách quan của bạn</h4>
                  </div>
                  <div class="modal-body">
                    <div class="well well-sm modaltensanpham"><?php echo $heading_title; ?></div>
                    <div class="boxthongtindanhgia">
                      <div class="thongtindanhgia-left">
                        Họ và tên:
                      </div>
                      <div class="thongtindanhgia-right">
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                      </div>
                    </div>
                    <div class="boxthongtindanhgia">
                      <div class="thongtindanhgia-left">
                        Nội dung nhận xét của bạn:
                      </div>
                      <div class="thongtindanhgia-right">
                        <textarea name="text" cols="25" rows="4" id="input-review" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="boxthongtindanhgia">
                      <div class="thongtindanhgia-left">
                        Đánh giá:
                      </div>
                      <div class="thongtindanhgia-right">
                        <div class="stars">
                          <input type="radio" name="rating" value="1" class="star-1" id="star-1"/>
                          <label class="star-1" for="star-1">1</label>
                          <input type="radio" name="rating" value="2" class="star-2" id="star-2"/>
                          <label class="star-2" for="star-2">2</label>
                          <input type="radio" name="rating" value="3" class="star-3" id="star-3"/>
                          <label class="star-3" for="star-3">3</label>
                          <input type="radio" name="rating" value="4" class="star-4" id="star-4"/>
                          <label class="star-4" for="star-4">4</label>
                          <input type="radio" name="rating" value="5" class="star-5" id="star-5"/>
                          <label class="star-5" for="star-5">5</label>
                          <span></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">Gửi</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <!-- end test -->

          <div class="tab-content">
            <?php if ($review_status) { ?>
            <div class="tab-pane active" id="tab-review">
              <div id="review"></div>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>

      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=news/article/review&article_id=<?php echo $article_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=news/article/write&article_id=<?php echo $article_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('.modaltensanpham').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
        $('.close').trigger('click');
      }
    }
  });
});

$(document).ready(function() {
  $('.thumbnails').magnificPopup({
    type:'image',
    delegate: 'a',
    gallery: {
      enabled:true
    }
  });
});
//--></script>
<?php echo $footer; ?>