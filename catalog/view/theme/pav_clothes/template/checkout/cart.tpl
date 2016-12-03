<?php echo $header; ?>

<div class="container">
  <?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
  <?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row">
    <?php if( $SPAN[0] ): ?>
    <aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>"> <?php echo $column_left; ?> </aside>
    <?php endif; ?>
    <section id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>">
      <div id="content"><?php echo $content_top; ?>
        <link href="http://sodahair.com/catalog/view/theme/pav_clothes/stylesheet/shopping_cart.css" rel="stylesheet" />
        <div class="container p2">
          <div data-test="order-summary" class="h3 py1">
            <div class="container p2">
              <div class="py3 h3 center">
                <div class="light-gray1"> 
                  <!-- react-text: 2748 --> 
                  You have 
                  <!-- /react-text --> 
                  <!-- react-text: 2749 --> 
                  <?php echo $text_items; ?> 
                  <!-- /react-text --> 
                  <!-- react-text: 2750 --> 
                  in your shopping bag. 
                  <!-- /react-text --> 
                </div>
              </div>
              <div data-test="order-summary" class="h3 py1">Review your order</div>
              <div class="mt2 clearfix mxn3">
                <div data-test="cart-line-items" style="border-top:solid 1px #dadada" class="col-on-tb-dt col-6-on-tb-dt px3 mb3">
                  <?php foreach ($products as $product) { ?>
                  <div class="clearfix mb1 border-bottom border-dark-silver py2">
                    <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>" class="left mr1"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="border border-dark-silver rounded"  title="<?php echo $product['name']; ?>" /></a>
                    <div class="overflow-hidden h5 dark-gray p1"><a href="<?php echo $product['href']; ?>" class="dark-gray medium titleize"><?php echo $product['name']; ?></a>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <div class="mt1 h6 line-height-2">
                        <div> 
                          <!-- react-text: 2802 --> 
                          <?php echo $option['name']; ?>: 
                          <!-- /react-text --> 
                          <!-- react-text: 2803 --> 
                          <?php echo $option['value']; ?> 
                          <!-- /react-text --> 
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($product['reward']) { ?>
                        <div><?php echo $product['reward']; ?></div>
                        <?php } ?>
                        <?php if ($product['recurring']) { ?>
                        <div><?php echo $text_recurring_item; ?></div>
                        <div><?php echo $product['recurring']; ?></div>
                        <?php } ?>
                        <div><?php echo $column_model; ?>: <?php echo $product['model']; ?></div>
                        <div><?php echo $column_price; ?>: <b><?php echo $product['price']; ?></b></div>
                        <div><?php echo $column_total; ?>: <b><?php echo $product['total']; ?></b></div>
                        <div class="mt2 flex items-center justify-between">
                          <div class="h31">
                            <div class="input-group btn-block" style="max-width: 200px;">
                              <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                              <span class="input-group-btn">
                              <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="button"><i class="fa fa-refresh"></i></button>
                              <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                              </span></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
                </div>
                <div class="col-on-tb-dt col-6-on-tb-dt px3">
                  <?php if ($coupon || $voucher || $reward || $shipping) { ?>
                  <!-- <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>-->
                  <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
                  <?php } ?>
                  <div>
                    <div class="py2 border-top border-bottom border-dark-silver">
                      <table class="col-12">
                        <tbody>
                          <tr class="h5 line-height-4">
                            <td>Shipping</td>
                            <td class="right-align medium navy">FREE( 3-5days Arrival)</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="py2 h2">
                      <?php foreach ($totals as $total) { ?>
                      <div class="flex1">
                        <div class="flex-auto light"><?php echo $total['title']; ?></div>
                        <div class="right-align gray"><?php echo $total['text']; ?></div>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="pb21"><a href="/index.php?route=payment/pp_express/express" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary bg-teal white">
                    <div>
                      <div> 
                        <!-- react-text: 2854 --> 
                        Check out 
                        <!-- /react-text --> 
                      </div>
                    </div>
                    </a></div>
                  <div class="h5 gray center py2">OR</div>
                  <div class="pb21"><a href="/index.php?route=payment/pp_express/express" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary bg-aqua white ">
                    <div>
                      <div> 
                        <!-- react-text: 2854 --> 
                        Check out with 
                        <!-- /react-text --> 
                        <span class="medium italic">PayPal&trade;</span></div>
                    </div>
                    </a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="border-top border-dark-silver bg-white">
          <div class="container">
            <div class="center px3 my2 line-height-4">
              <div class="medium f4 gray">Need Help?</div>
              <div class="gray light f5"><span class="hide-on-tb-dt"></span><span class="hide-on-mb">+1 (646) 934-6206</span><!-- react-text: 535 --> | info@sodahair.com<!-- /react-text --></div>
            </div>
          </div>
        </div>
        <?php echo $content_bottom; ?></div>
    </section>
    <?php if( $SPAN[2] ): ?>
    <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>"> <?php echo $column_right; ?> </aside>
    <?php endif; ?>
  </div>
</div>
