<?php 
ob_start();
$content = '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kopi Legend</title>
    <link href="'.base_url().'assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
    .center {
        margin: auto;
        /* width: 50%; */
        /* border: 3px solid green; */
        /* padding: 10px; */
        font-size: 5px
    }
</style>
    <script>
        // window.print();
    </script>
</head>
<body class="center">
?>
    <?php 
    $no=1;
    
    $output = '';
    $output .= '<p class="text-dark" style="font-size: 7px">Kopi Legend<br>
                                    Gang PU<br>
                                tlp. 081379434242<br><br>
    no &nbsp; &nbsp; &nbsp; : '.$this->session->userdata('id_user').'<br>
                    kasir &nbsp; : '.$this->session->userdata('nama_user').'<br>
    tgl &nbsp; &nbsp; &nbsp; : '.date('Y-m-d  h:i:s').'<br>
    trx &nbsp; &nbsp; &nbsp; : '.$re1->row()->kode_resep.'<br>
                </p>
                <table style="font-size:7px; width: 100%">
                <thead>
                    <tr style="border-top:1px dashed">
                        <th >No</th>
                        <th>Menu</th>
                        <th>qty</th>
                        <th>harga</th>
                        <th>Sub</th>
                    </tr>
                </thead>
                <tbody>';
                $tot = 0;
                foreach($re->result() as $resep_detail){
                    $t = $resep_detail->jumlah * $resep_detail->harga_jual;
                    $tot += $t;
    $output .= 		'<tr>
                        <td>'.$no++.'</td>
                        <td>'.$resep_detail->nama_obat.'</td>
                        <td>'.$resep_detail->jumlah.'</td>
                        <td>'.number_format($resep_detail->harga_jual, '0', ',', '.').'</td>
                        <td>'.number_format($t, '0', ',', '.').'</td>
                    </tr>';
                    }
    $output .= 		'<tr style="border-top:1px dashed">
                        <td colspan="4" style="text-align:right">Total :</td>
                        <td>'.number_format($tot, '0', ',', '.').'</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:right">Bayar :</td>
                        <td>'.number_format($re1->row()->uang_dibayarkan, '0', ',', '.').'</td>
                    </tr>
                    <tr style="border-bottom:1px dashed">
                        <td colspan="4" style="text-align:right">Kembali :</td>
                        <td>'.number_format($re1->row()->uang_dibayarkan - $tot, '0', ',', '.').'</td>
                    </tr>
                </tbody>
                </table>
                <br/>
                =============================<br>
        <div style="font-size:7px">terimakasih atas kunjungan anda <br/> create by: Okta Pilopa <br/> ig: @pilopaokta</div>';
        // echo $output;
    
 
?>
</body>
</html>
<?php

$filename="mhs.pdf"; //ubah untuk menentukan nama file pdf yang dihasilkan nantinya
//==========================================================================================================
//Copy dan paste langsung script dibawah ini,untuk mengetahui lebih jelas tentang fungsinya silahkan baca-baca tutorial tentang HTML2PDF
//==========================================================================================================
require './assets/html2pdf/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
$html2pdf = new Html2Pdf('P',array(68,156),'fr', true, 'UTF-8', array(0, 0, 0, 0), false); 
$html2pdf->writeHTML($output);
ob_end_clean();
$html2pdf->output();
?>