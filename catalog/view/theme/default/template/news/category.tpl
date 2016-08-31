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
                      <input id="search_blog" type="text" name="filter_name" value="<?php echo $filter_name;?>" class="form-control" aria-haspopup="false" maxlength="128" role="combobox" placeholder="Tìm kiếm bài viết..." aria-autocomplete="both" autocomplete="off">
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

      </div>
    </div>
    <div id="content" class="col-md-9">
      <?php echo $content_top; ?>

      <div class="wrapbtintuc wrap-article">
        <?php if ($top_article): ?>
        <div class="btinmoinhat">
          <div class="img-btinmoinhat">
            <a href="<?php echo $top_article['href']; ?>"><img src="<?php echo $top_article['thumb']; ?>"/></a>
          </div>
          <div class="tit-btinmoinhat">
            <a href="<?php echo $top_article['href']; ?>"><?php echo $top_article['name']; ?></a>
            <p><?php echo $top_article['short_description']; ?></p>
          </div>
          <a href="<?php echo $top_article['href']; ?>" class="xemchitiet">Xem thêm >></a>
        </div>
        <div class="btintuc">

            <?php foreach ($articles as $article): ?>
              <div class="itemstintuc">
              <div class="img-itemstintuc">
                <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>"/></a>
                <div class="txtboximage">
                  <a href="<?php echo $article['href']; ?>" class="btn btn-boximage">Xem chi tiết</a>
                </div>
              </div>
              <div class="tit-itemstintuc">
                <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
              </div>
              <div class="des-itemstintuc">
                <?php echo $article['short_description']; ?>
              </div>
              <div class="more-itemstintuc">
                <a href="<?php echo $article['href']; ?>">Xem chi tiết</a>
              </div>
          </div>
            <?php endforeach;?>
          <?php else: ?>
            <p><?php echo $text_empty; ?></p>
          <?php endif;?>
        </div>
        <div class="pagination-btintuc">
          <?php echo $pagination; ?>
        </div>
      </div>

      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
