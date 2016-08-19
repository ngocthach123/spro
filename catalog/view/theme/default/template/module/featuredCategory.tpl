<div class="wrapfeaturedhome">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="catefeaturedproduct-home">
                    <div class="headercatefeatured-home">
                        <div class="col-md-12 col-sm-12 col-xs-12 txtheadercatefeatured-home pdglrn">
                            <p class="titleboxheading-home"><?php echo $heading_title; ?></p>
                        </div>
                    </div>
                    <div class="contentcatefeaturedproduct-home">
                        <?php foreach ($categories as $category) { ?>
                            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
                                <div class="boximagecate-home">
                                    <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"/></a>
                                </div>
                                <div class="boxnamecate-home">
                                    <h2><?php echo $category['name']; ?></h2>
                                    <?php if($category['children']):?>
                                        <ul class="listcate-home">
                                            <?php foreach($category['children'] as $child):?>
                                                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                            <?php endforeach;?>
                                        </ul>
                                    <?php endif;?>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

