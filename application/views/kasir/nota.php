<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kopi Legend</title>
    <link href="<?= base_url('assets/'); ?>vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
    .center {
        margin: auto;
        width: 50%;
        /* border: 3px solid green; */
        padding: 10px;
        font-size: 9px
    }
</style>
    <script>
        window.print();
    </script>
</head>
<body class="center">
    <?php 
    $no=1;
    $output = '';
    $output = '<p class="text-dark">Kopi Legend<br>
                                    Gang PU<br>
                                tlp 08xxxxx<br>
    no &nbsp; &nbsp; &nbsp; : '.$this->session->userdata('id_user').'<br>
                    kasir &nbsp; : '.$this->session->userdata('nama_user').'<br>
    tgl &nbsp; &nbsp; &nbsp; : '.date('Y-m-d  h:i:s').'<br>
                </p>
                <table>
                <thead>
                    <tr style="border-top:1px dashed">
                        <th width="50">No</th>
                        <th width="100">Nama</th>
                        <th width="50">qty</th>
                        <th>harga</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>';
                $tot = 0;
                foreach($re->result() as $resep_detail){
                    $t = $resep_detail->jumlah * $resep_detail->harga_jual;
                    $tot += $t;
    $output .= 		'<tr>
                        <td>'.$no++.'</td>
                        <td>'.$resep_detail->kode_obat.'-'.$resep_detail->nama_obat.'</td>
                        <td>'.$resep_detail->jumlah.'</td>
                        <td>Rp.'.number_format($resep_detail->harga_jual, '0', ',', '.').'</td>
                        <td>Rp.'.number_format($t, '0', ',', '.').'</td>
                    </tr>';
                    }
    $output .= 		'<tr style="border-top:1px dashed">
                        <td colspan="4" style="text-align:right">Total :</td>
                        <td>Rp.'.number_format($tot, '0', ',', '.').'</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:right">Bayar :</td>
                        <td>Rp.'.number_format($re1->row()->uang_dibayarkan, '0', ',', '.').'</td>
                    </tr>
                    <tr style="border-bottom:1px dashed">
                        <td colspan="4" style="text-align:right">Kembali :</td>
                        <td>Rp.'.number_format($re1->row()->uang_dibayarkan - $tot, '0', ',', '.').'</td>
                    </tr>
                </tbody>
                </table>
                <br/>
        <div>terimakasih atas kunjungan anda</div>';
        echo $output;
    ?>
</body>
</html>