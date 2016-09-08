<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <style>
        body,h1,h2,h3,h4,h5 { font-family: DejaVu Sans, sans-serif;}
        body{font-size: 12px}

    </style>

    <table height="143" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="4" align="left" width="160"><img src="<?php echo DIR_IMAGE;?>logo_report.jpg"/></td>
            <td height="30" style="text-transform: uppercase"><strong><?php echo $owner;?></strong></td>
        </tr>
        <tr>
            <td height="20">Địa chỉ: <?php echo $address;?></td>
        </tr>
        <tr>
            <td height="20">Điện thoại: <?php echo $phone;?>   Fax: <?php echo $fax;?> </td>
        </tr>
        <tr>
            <td height="20">Website: <a href="http://spro.vn">http://spro.vn</a> –  Email: <?php echo $email;?> </td>
        </tr>
    </table>
    <hr size="3" noshade="noshade" style="background-color: #0a001f"/>
    <h2 align="center"><strong>BÁO GIÁ  THIẾT BỊ</strong></h2>
    <table border="0">
        <tr>
            <td><em>Kính gửi</em></td>
            <td>: <?php echo $report_info['customer'];?></td>
            <td><em>Người báo giá</em></td>
            <td>: <?php echo $user['firstname'].' '.$user['lastname'];?></td>
        </tr>
        <tr>
            <td><em>Đơn vị</em></td>
            <td>: <?php echo $report_info['work_place'];?></td>
            <td><em>Điện thoại</em></td>
            <td>: <?php echo $user['phone'];?></td>
        </tr>
        <tr>
            <td valign="top"><em>Địa chỉ</em></td>
            <td>: <?php echo $report_info['address'];?></td>
            <td valign="top"><em>Số Báo Giá</em></td>
            <td valign="top">: <?php echo $report_info['report_code'];?></td>
        </tr>
        <tr>
            <td><em>Điện thoại/Fax</em></td>
            <td>: <?php echo $report_info['phone'];?></td>
            <td><em>Ngày Báo Giá</em></td>
            <td>: <?php echo $report_info['date_added'];?></td>
        </tr>
        <tr>
            <td><em>Email</em></td>
            <td>: <?php echo $report_info['email'];?></td>
            <td><em>Email</em></td>
            <td>: hotrospro@gmail.com</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td height="68" colspan="4"><p>NAMVIET PRO.  Là Công ty chuyên cung cấp các loại máy móc  ngành tẩy rửa công nghiệp, các loại vật tư, thiết bị cho các garage sửa chữa,  bảo dưỡng ô tô, xe máy...Chúng tôi xin trân trọng gửi tới Quý khách hàng báo  giá các thiết bị với giá cả và dịch vụ như sau:</p></td>
        </tr>
    </table>
    <table border="1" cellspacing="0">
        <tr>
            <td height="52" align="center" valign="middle"><strong>Stt</strong></td>
            <td align="center" valign="middle"><strong><em>Tên thiết bị, thông  số kỹ thuật</em></strong></td>
            <td align="center" valign="middle"><strong><em>SL</em></strong></td>
            <td align="center" valign="middle"><p><strong><em>Đơn giá</em></strong>      <strong><em>(VNĐ)</em></strong></p></td>
            <td align="center" valign="middle"><p align="center"><strong><em>Thành tiền </em></strong><strong><em>(VNĐ)</em></strong></p></td>
            <td align="center" valign="middle"><strong><em>Hình ảnh thiết bị</em></strong></td>
        </tr>
        <?php $i = 1; foreach($products as $product):?>
            <tr>
                <td height="35" align="center" width="20"><?php echo $i;?></td>
                <td width="200"><?php echo $product['name'];?> <br/> <?php echo $product['specs'];?></td>
                <td align="center" width="20"><?php echo $product['quantity'];?></td>
                <td><?php echo $product['price'];?></td>
                <td><?php echo $product['sub_total'];?></td>
                <td><img src="<?php echo $product['image'];?>"/></td>
            </tr>
        <?php $i++; endforeach;?>
    </table>
    <table border="0">
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3"><p><strong><u>Ghi Chú:</u></strong><br />
                    <strong>* Giá trên chưa bao gồm:</strong><br />
                    -  Thuế VAT 10%<br />
                    -  Chi phí vận chuyển<br />
                    <strong>* Hình thức thanh toán</strong><br />
                    - Chuyển khoản hoặc  tiền mặt<br />
                    - Thanh toán  100%  đối với hàng hóa trị giá dưới 50tr  đồng. Trên 50tr thanh toán làm 2 đợt<br />
                    + Lần 1: Thanh toán 30% giá trị hàng  hóa<br />
                    + Lần 2: Thanh toán 70% giá trị hàng  hóa sau khi nghiệm thu thiết bị.<br />
                    <strong>* Giá trên đã  bao gồm:</strong><br />
                    -  Chi lắp đặt và hướng dẫn sử dụng tại địa chỉ  giao hàng<br />
                    <strong>*  Dịch vụ sau bán  hàng:</strong><br />
                    Công ty Nam  Việt  đảm bảo cung cấp các phụ tùng thay  thế chính hãng theo yêu cầu của khách hàng<br />
                    <strong>- Báo giá này có giá trị</strong> : Trong vòng 30 ngày kể từ ngày gửi báo giá<br />
                    <strong><u><br />
                            Thông tin tài khoản</u></strong><br />
                    Chủ TK :  <strong>CÔNG TY TNHH CÔNG NGHIỆP VÀ THƯƠNG MẠI NAM  VIỆT</strong><br />
                    Địa chỉ :  143 Bình Lợi, Phường 13, Q.Bình Thạnh<br />
                    Điện thoại : 083  5534 298<br />
                    Fax : 08 - 35 534  310<br />
                    Tài khoản số :  060059386363<br />
                    Tại : Ngân hàng  SACOMBANK Phòng giao dịch Phú Nhuận - Chi nhánh 8/3-TP.HCM   <br />
                    Mã số thuế :   0312045729</p>
                <p align="left"><strong>Chúng tôi xin chân thành cảm ơn sự  quan tâm của Quý khách và rất mong sự phúc đáp sớm nhất của Quý khách</strong></p>
                <h3 align="right">&nbsp;</h3></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="text-align: center"><h3 align="center">CTY TNHH CN &amp; TM NAM VIỆT </h3>
                <p align="center"><strong>   </strong>Phòng Kinh  Doanh</p></td>
            <td height="33" width="20"><h3 align="right">&nbsp;</h3></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><h3 align="right"><img src="<?php echo DIR_IMAGE;?>sign.jpg"/></h3></td>
        </tr>
    </table>
</body>
</html>