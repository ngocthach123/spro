<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <!-- add scrtipt -->
      <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCvwryvPG1-OcPRLrMb89YcrFRlTbJQ69g&libraries=places"></script>
      <script src="catalog/view/javascript/js/jquery.bxslider.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/js/jquery.ba-throttle-debounce.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/js/jquery.bridget.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/js/magnificent.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/js/jquery.fancybox.js" type="text/javascript"></script>
      <link href="catalog/view/javascript/js/jquery.bxslider.css" rel="stylesheet">
      <link href="catalog/view/javascript/js/magnificent.css" rel="stylesheet">
      <link href="catalog/view/javascript/js/magnific-popup.css" rel="stylesheet">
      <link href="catalog/view/javascript/js/jquery.fancybox.css" rel="stylesheet">
      <script type="text/javascript">
        $(document).ready(function () {
          var o = $('#image-additional');
          o.find('li:first-child a').addClass('active');

          $('#productimage').bind("click", function (e) {
            var imgArr = [];
            o.find('a').each(function () {
              img_src = $(this).data("image");

              //put the current image at the start
              if (img_src == $('#productimage').find('img').attr('src')) {
                imgArr.unshift({
                  href: '' + img_src + '',
                  title: $(this).find('img').attr("title")
                });
              }
              else {
                imgArr.push({
                  href: '' + img_src + '',
                  title: $(this).find('img').attr("title")
                });
              }
            });
            $.fancybox(imgArr);
            return false;
          });

          o.find('[data-image]').click(function (e) {
            e.preventDefault();
            o.find('.active').removeClass('active');
            var img = $(this).data('image');
            $(this).addClass('active');
            $('#productimage').find('.inner img').each(function () {
              $(this).attr('src', img);
            });
          });
        });

        $(document).ready(function () {
          var o = $('#image-additional');

          $('#image-additional').bxSlider({
            mode: 'horizontal',
            pager: false,
            controls: true,
            slideMargin: 13,
            minSlides: 3,
            maxSlides: 3,
            slideWidth: 125,
            nextText: '<i class="fa fa-angle-right"></i>',
            prevText: '<i class="fa fa-angle-left"></i>',
            infiniteLoop: false,
            adaptiveHeight: true,
            moveSlides: 1
          });
        });
      </script>
      <script class="source">
        $(function () {
          $('#productimage [data-magnificent]').magnificent();
        });
      </script>
      <!-- end add script -->
      <!-- contenthead-product -->
      <div class="contenthead-product"  id="product">
        <div class="detailspd-product">
          <!-- imagespd-product -->
          <div class="imagespd-product">
          <?php if ($thumb || $images): ?>
            <!-- productimage -->
            <div id="productimage" class="productimage">
              <div class="magnificent-wrap">
                <div class="magnificent" data-magnificent="productimage">
                  <div class="polaroid">
                    <div class="inner">
                      <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="magnificent-viewport-wrap">
                <div data-magnificent-viewport="productimage">
                  <div class="inner">
                    <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                  </div>
                </div>
              </div>
            </div>
            <!-- productimages -->
            <div id="productimages">
              <?php if ($images): ?>
                <ul id="image-additional">
                  <li>
                    <a data-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                  </li>
                  <?php foreach ($images as $image): ?>
                    <li>
                      <a data-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                    </li>
                  <?php endforeach;?>
                </ul>
              <?php endif;?>
            </div><!-- end productimages -->
            <?php endif;?>
          </div><!-- end imagespd-product -->
          <!-- infodetailpd-product -->
          <div class="infodetailpd-product">
            <h3><?php echo $heading_title; ?></h3>
            <div class="headreview">
              <img src="image/rating_star.png"/>
              (<?php echo $count_reviews;?> nhận xét) <a  id="datcauhoi" href=".nhanxetvesanpham" ><img src="image/fillter.png"/> <span class="datcauhoi">Viết nhận xét</span></a>
            </div>
            <div class="ifdetails">
              <?php if ($price): ?>
                <?php if ($special):?>
                  <span class="txtprice">Giá cũ:</span> &nbsp;<span class="tlineprice"><?php echo $price; ?></span><br>
                  <span class="txtprice">Giá mới:</span> &nbsp;<span class="bredprice"><?php echo $tax; ?></span> (Đã có VAT)<br>
                  <span class="txtprice">Tiết kiệm:</span> &nbsp;<span class="brsmallprice"><?php echo $price_down; ?> (<?php echo $specialper; ?>%)</span><br>
                <?php else: ?>
                  <span class="txtprice">Giá:</span> &nbsp;<span class="bredprice"><?php echo $tax; ?></span> (Đã có VAT)<br>
                <?php endif;?>
              <?php else: ?>
                <span class="txtprice">Giá:</span> &nbsp;<span class="brsmallprice">Liên hệ</span><br>
              <?php endif;?>
              <span>
                <?php if($soldout):?>
                   <span class="txtprice">Tình trạng: </span>
                <?php else: ?>
                 <i class="fa fa-check-square-o"></i>
                <?php endif;?>
                <?php echo $stock; ?>
              </span><br>
              Thời gian giao hàng: 48h (không kể ngày nghỉ).<br>
              Vui lòng đọc kỹ chính sách vận chuyển <a class="actpr" href="<?php echo $cs_van_chuyen;?>"><span>tại đây</span></a><br>
              <span class="txtprice">Mã sản phẩm:</span> <b><?php echo $model;?></b><br>
              <span class="txtprice">Hãng sản xuất:</span> <b><?php echo $manufacturer;?></b><br>

              <?php echo $short_description;?>
                <br/>
              <i class="fa fa-angle-right"></i> <a id="link-detail" href="#detail-product" class="actpr">Xem chi tiết</a>

              <?php if ($options[0]['product_option_value'] || $bonus_description): ?>
                <div class="dichvukhuyenmai">
                  <p class="txtdvkm">Dịch vụ và Khuyến mãi</p>
                  <div class="detailkhuyenmai">
                    <div class="imgdetailkhuyenmai">
                      <img src="image/gift.jpg"/>
                    </div>
                    <div class="freegift">
                      <span>Quà tặng miễn phí</span>
                       <?php echo $bonus_description;?>
                    </div>
                  </div>
                  <div class="itemkhuyenmai">
                    <?php foreach ($options as $option): ?>
                      <?php if ($option['type'] == 'radio'):?>
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <div class="radio">
                            <label>
                              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" id="optionsRadios1" value="<?php echo $option_value['product_option_value_id']; ?>">
                              <span> <?php echo $option_value['text']; ?></span>
                            </label>
                          </div>
                      <?php }?>
                      <?php endif;?>
                    <?php endforeach;?>
                  </div><!-- end itemkhuyenmai -->
                </div><!-- dichvukhuyenmai -->
              <?php endif;?>

            </div><!-- ifdetails -->
          </div><!-- infodetailpd-product -->

          <!-- shippingpd-product -->
          <div class="shippingpd-product">
            <div class="calshipping">
              <div class="selectaddress">
                <h4>Tùy chọn giao hàng</h4>
                Tỉnh/Thành
                <select id="zone" name="zone">
                  <option>Chọn Tỉnh/Thành phố</option>
                </select>
                Quận/Huyện
                <select id="district" name="district">
                  <option>Chọn Quận/Huyện</option>
                </select>
              </div>

              <div id="shipping_cost">

              </div>

              <div class="thanhtoankhinhan">
                <div class="imgphivanchuyen">
                  <img src="image/icondollarbill.png"/>
                </div>
                <div class="textphivanchuyen">
                  Quý khách có thể "Thanh toán khi nhận hàng"
                </div>
              </div>
              <div class="boxbuyproduct">
                <div class="quantity">
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity"/>
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                  <?php if($stock_status_id && $stock_status_id == 8):?>
                  <a class="btnbuy" data-toggle="modal" data-target="#modal-order">
                    Đặt hàng
                  </a>
                  <!-- Modal -->
                  <div class="modal fade" id="modal-order" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <form id="form-order">
                          <input type="hidden" name="product_name" value="<?php echo $heading_title; ?>"/>
                          <input type="hidden" name="product_model" value="<?php echo $model; ?>"/>
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title modaldanhgia" id="myModalLabel">Gửi yêu cầu đặt hàng</h4>
                          </div>
                          <div class="modal-body">
                            <div class="well well-sm modaltenkhach"><?php echo $heading_title; ?></div>
                            <div class="boxthongtindanhgia">
                              <div class="thongtindanhgia-left">
                                Họ và tên:
                              </div>
                              <div class="thongtindanhgia-right">
                                <input type="text" name="order_name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                              </div>
                            </div>
                            <div class="boxthongtindanhgia">
                              <div class="thongtindanhgia-left">
                               Email:
                              </div>
                              <div class="thongtindanhgia-right">
                                <input type="text" name="order_email" value="" id="input-name" class="form-control" />
                              </div>
                            </div>
                            <div class="boxthongtindanhgia">
                              <div class="thongtindanhgia-left">
                                Nội dung:
                              </div>
                              <div class="thongtindanhgia-right">
                                <textarea name="order_text" cols="25" rows="4" id="input-review" class="form-control">Tôi muốn đặt hàng trước sản phẩm <?php echo $heading_title;?> - Mã: <?php echo $model;?></textarea>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" id="button-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">Gửi</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <?php else:?>
                    <a type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btnbuy"><?php echo $button_cart; ?></a>
                  <?php endif;?>
                </div>
                <div class="spyeuthich">
                  <a onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o"></i> Tôi thích sản phẩm này</a>
                </div>
              </div>
            </div><!-- end calshipping -->
            <!-- baogiakh -->
            <div class="baogiakh">
              <a href="#" class="bgckh" data-toggle="modal" data-target="#myModalbaogia">Yêu cầu báo giá ngay</a>
              <!-- test -->
              <div id="myModalbaogia" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md">
                  <div class="modal-content ctmodalbaogia">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Yêu cầu báo giá</h4>
                    </div>
                    <div class="modal-body bdmodalbaogia">
                      <div class="bdmodalbaogia-right">
                        Tên: <span>*</span><br>
                        <input type="text" name="customer"/><br>
                        Số điện thoại: <span>*</span><br>
                        <input type="text" name="phone"/><br>
                        Email: <span>*</span><br>
                        <input type="text" name="email"/><br>
                        <label><input type="checkbox"/> <span>Tôi đồng ý</span> Điều khoản sử dụng của SPRO.VN</label><br>
                        <button type="button" class="btnguibaogian" id="btn-send-report">Gửi yêu cầu báo giá ngay</button>
                      </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                  </div>
                </div>
              </div>
              <!-- end test -->
            </div>
          </div><!-- end shippingpd-product -->
        </div>

        <?php if($accessories):?>
        <div class="boxphukien">
          <div class="headingphukien">
            <p class="titheading-allpage">Phụ kiện</p>
          </div>
          <div class="contentphukien">
            <?php foreach($accessories as $access): ?>
            <div class="itemphukien">

              <div class="img-itemphukien">
                <img src="<?php echo $access['image']; ?>"/>
              </div>


              <div class="middlephukien">
                        <span class="name-itemphukien">
                          <a href="<?php echo $access['href'];?>"><?php echo $access['name']; ?></a>
                        </span>
                <?php if($access['special']): ?>
                <div class="wrapgiaphukien">
                  <div class="txtgiaphukien">
                    Giá niêm yết:
                  </div>
                  <div class="pricegiaphukien">
                    <?php echo $access['price']; ?>
                  </div>
                </div>
                <div class="wrapgiaphukien">
                  <div class="txtgiaphukien clred">
                    Giá bán:
                  </div>
                  <div class="pricegiaphukien clred">
                    <?php echo $access['special']; ?>
                  </div>
                </div>
                <div class="wrapgiaphukien">
                  <div class="txtgiaphukien">
                    Tiết kiệm:
                  </div>
                  <div class="pricegiaphukien">
                    <?php echo $access['price_down']; ?> (<?php echo $access['specialper']; ?>%)
                  </div>
                </div>
                <?php else: ?>
                <div class="wrapgiaphukien">
                  <div class="txtgiaphukien clred">
                    Giá bán:
                  </div>
                  <div class="pricegiaphukien clred">
                    <?php echo $access['price']; ?>
                  </div>
                </div>
                <?php endif;?>
                <div class="nutphukien">
                  <a class="btnphukien button-cart-access" data-loading-text="<?php echo $text_loading; ?>" access-id="<?php echo $access['product_id'];?>" has-Sale="<?php echo $access['hasSale'];?>"><?php echo $button_cart; ?></a>
                </div>
              </div><!-- end contentphukien -->
            </div><!-- end itemphukien -->
            <?php endforeach;?>
          </div><!-- end contentphukien -->
        </div><!-- end boxphukien -->
        <?php endif;?>

        <div class="information-product">
          <div class="colinfor">
            <div class="img-colinfor">
              <img src="image/hdmh.png"/>
            </div>
            <div class="content-colinfor">
              <a href="<?php echo $hd_mua_hang;?>">Hướng dẫn mua hàng</a><br>
              Mua hàng online an toàn, không khó
            </div>
          </div>
          <div class="colinfor">
            <div class="img-colinfor">
              <img src="image/cttt.png"/>
            </div>
            <div class="content-colinfor">
              <a href="<?php echo $cach_thuc_tt;?>">Cách thức thanh toán</a><br>
              Xem đầy đủ các thông tin thanh toán
            </div>
          </div>
          <div class="colinfor">
            <div class="img-colinfor">
              <img src="image/csvc.png"/>
            </div>
            <div class="content-colinfor">
              <a href="<?php echo $cs_van_chuyen;?>">Chính sách vận chuyển</a><br>
              Xem đầy đủ các thông tin thanh toán
            </div>
          </div>
        </div>
      </div><!-- end contenthead-product -->
      <!-- contentmiddle-product -->
      <div class="contentmiddle-product" id="detail-product">

        <div class="boxdetailandnews">
          <div class="descdetails-product">
            <div class="tab-content">
              <div class="headhoidap">
                <p class="titheading-allpage">Mô tả sản phẩm</p>
              </div>
              <div id="motasanpham-product" class="">
                <p>
                  <?php echo $description;?>
                </p>
              </div>
              <div class="headhoidap">
                <p class="titheading-allpage">Thông số kỹ thuật</p>
              </div>
              <div id="thongsokythuat-product" class="">
                <p>
                  <?php echo $specs_description;?>
                 </p>
              </div>
            </div>
          </div><!-- end descdetails-product -->
        <?php if($articles):?>
          <div class="newspart-product">
            <div class="boxnewsrelated">
              <div class="headingnewsrelated">
                Bài viết liên quan
              </div>
              <div class="contentnewsrelated">
                <ul class="categorynewsrelated">
                  <?php foreach($articles as $article):?>
                    <li><a href="<?php echo $article['href'];?>"><?php echo $article['name'];?></a></li>
                  <?php endforeach;?>
                </ul>
              </div>
            </div><!-- end boxnewsrelated -->
          </div><!-- end newspart-product -->
          <?php endif;?>
        </div><!-- end boxdetailandnews -->

        <?php if ($products):?>
         <div class="boxproductrelated">
          <div class="headproductrelated">
            <p class="titheading-allpage"><?php echo $text_related; ?></p>
          </div>
          <div class="middleproductrelated">
            <!-- 1 -->
            <?php foreach ($products as $product): ?>
              <div class="colitemproduct">
              <div class="itemproduct">
                <div class="wrapbox-product">
                  <div class="contentbox-product">
                    <?php if ($product['special']): ?>
                      <div class="boxsale-product">
                        Sale
                      </div>
                    <?php endif;?>
                    <div class="boximage-product">
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"></a>
                      <div class="txtboximage">
                        <a href="<?php echo $product['href']; ?>" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </div>
                    <div class="boxprice-product">
                      <?php if ($product['special']): ?>
                        <div class="productprice wbp">
                          <span class="productsell"><?php echo $product['special']; ?></span>
                          <span class="productsale"> <?php echo $product['price']; ?></span>
                        </div>
                        <div class="percentsale wps">
                          <span class="percentdiscount">-20%</span>
                        </div>
                      <?php else: ?>
                        <div class="productprice wbp">
                          <span class="productsell"> <?php echo $product['price']; ?></span>
                        </div>
                      <?php endif;?>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <?php endforeach;?>
            <!-- 2 -->
          </div><!-- end middleproductrelated -->
        </div><!-- end boxproductrelated -->
        <?php endif;?>
      </div><!-- end contentmiddle-product -->
      <?php if ($review_status): ?>
        <div class="contentfooter-product">

        <div class="nhanxetvesanpham">
          <div class="headnhanxet">
            <p class="titheading-allpage">Nhận xét về sản phẩm</p>
          </div>
          <div class="contentnhanxet">
            <div class="boxdanhgia">
              <div class="diemdanhgia">
                <b class="txtdanhgia">Đánh giá trung bình</b>
                <h2><?php echo $rating;?>/5</h2>
                <?php for($i=0; $i<5; $i++):?>
                  <?php if ($rating <= $i ) { ?>
                  <span class="fa fa-stack star-grey"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack star-yelow"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                <?php endfor;?>
               <br>
                (<?php echo $count_reviews;?> nhận xét)
              </div>
              <div class="soluongdanhgia">
                <?php foreach($ratings as $rating): ?>
                  <div class="wrapprogress">
                    <div class="sosaodanhgia">
                      <?php echo $rating['rating']; ?> sao
                    </div>
                    <div class="progress">
                      <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<?php echo $rating['percent'];?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $rating['percent'];?>%">
                      </div>
                    </div>
                    <div class="songuoidanhgia">
                     <?php echo $rating['num_rate']; ?>
                    </div>
                  </div>
                <?php endforeach; ?>

              </div>
              <div class="vietdanhgia">
                <b class="txtdanhgia">Chia sẻ nhận xét về sản phẩm</b><br>
                <!-- <a href="#" class="vnx">Viết nhận xét của bạn</a> -->
                <!-- test -->
                <!-- Button trigger modal -->
                <a class="vnx" data-toggle="modal" data-target="#myModal">
                  Viết nhận xét của bạn
                </a>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <form id="form-review">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title modaldanhgia" id="myModalLabel">Chúng tôi muốn nhận được những đánh giá khách quan của bạn</h4>
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
                              Nội dung đánh giá của bạn:
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
              </div>
            </div><!-- end boxdanhgia -->
            <div class="cacnhanxetdd" id="review">

            </div><!-- cacnhanxetdd -->
          </div><!-- end contentnhanxet -->
        </div><!-- end nhanxetvesanpham -->
      </div><!-- end contentfooter-product -->
      <?php endif;?>
    </div>
    <?php echo $column_right; ?></div>
</div>

<script>

  $('#link-detail').click(function(){
    $('html, body').animate({
      scrollTop: $( $(this).attr('href') ).offset().top
    }, 500);
    return false;
  });

  $('#datcauhoi').click(function(){
    $('html, body').animate({
      scrollTop: $( $(this).attr('href') ).offset().top
    }, 500);
    return false;
  });
</script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#shoppingcart span.top-quantity').html(json['total_origin']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});

  $('.button-cart-access').on('click', function() {
    if( $(this).attr('has-Sale')!=0){ //mua kem sp
      $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: {
          product_id: $("input[name='product_id']").val(),
          quantity: 1,
          buy_with_access: 1
        },
        dataType: 'json',
        success: function(json) {
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }

    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: {
        product_id: $(this).attr('access-id'),
        hasSale: $(this).attr('has-Sale'),
        quantity: 1,
        parent_id: $("input[name='product_id']").val()
      },
      dataType: 'json',
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#input-option' + i.replace('_', '-'));

              if (element.parent().hasClass('input-group')) {
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }

          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }

          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }

        if (json['success']) {
          $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('#shoppingcart span.top-quantity').html(json['total_origin']);

          $('html, body').animate({ scrollTop: 0 }, 'slow');

          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
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
				$('.boxdanhgia').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

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

<script type="text/javascript">

  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=230',
    dataType: 'json',
    success: function(json) {

      html = '<option value="">Chọn Tỉnh/Thành phố</option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected">Chọn Tỉnh/Thành phố</option>';
      }

      $('#zone').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });

    $('#zone').on('change', function() {
      $.ajax({
        url: 'index.php?route=checkout/checkout/district&zone_id=' + this.value,
        dataType: 'json',
        success: function(json) {

          html = '<option value="">Chọn Quận/Huyện</option>';

          if (json && json != '') {
            for (i = 0; i < json.length; i++) {
              html += '<option value="' + json[i]['district_id'] + '"';

              html += '>' + json[i]['name'] + '</option>';
            }
          } else {
            html += '<option value="0" selected="selected">Chọn Quận/Huyện</option>';
          }

          $('#district').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    });

    $('#zone').trigger('change');

  $('#district').on('change', function() {
    //*********DIRECTIONS AND ROUTE**********************//
    var source = '<?php echo $store_address;?>';
    var zone = $("select[name='zone'] option:selected").html();
    var district = $("select[name='district'] option:selected").html();

    var destination = district + ',' + zone + 'Việt Nam';

    //*********DISTANCE AND DURATION**********************//
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
      origins: [source],
      destinations: [destination],
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, function (response, status) {
      if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
        var distance = response.rows[0].elements[0].distance.value;
        var duration = response.rows[0].elements[0].duration.text;
        //CHANGE M TO KM
        distance = distance / 1000;
        distance = distance.toFixed(2);

        //send

        $.ajax({
          url: 'index.php?route=checkout/shipping_method/costbyproduct',
          type: 'post',
          dataType: 'html',
          data: {
            distance: distance,
            product_id: $("input[name='product_id']").val()
          },
          success: function (html) {
            $('#shipping_cost').html(html);

          },
          error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });

      } else {
        alert("Không thể tính khoảng cách bằng đường bộ.");
      }
    });
  });
</script>

<script>
  $('#btn-send-report').click(function(){
    if($("input[name='email']").val()==''){
      $('.bdmodalbaogia').prepend('<div class="alert alert-danger">Bạn chưa nhập email<button type="button" class="close" data-dismiss="alert">×</button></div>');
      return false;
    }
    var url = "<?php echo html_entity_decode($action_baogia);?>";
    url += "&quantity="+$("input[name='quantity']").val();
    url += "&customer="+$("input[name='customer']").val();
    url += "&phone="+$("input[name='phone']").val();
    url += "&email="+$("input[name='email']").val();
    url += "&address=";

    window.location.replace(url);
  });
</script>

<script>
  $('#button-order').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/order&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: $("#form-order").serialize(),
      beforeSend: function() {
        $('#button-order').button('loading');
      },
      complete: function() {
        $('#button-order').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('.modaltenkhach').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }

        if (json['success']) {
          $('#content').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

          $('input[name=\'order_name\']').val('');
          $('input[name=\'order_email\']').val('');
          $('.close').trigger('click');
        }
      }
    });
  });
</script>
<?php echo $footer; ?>
