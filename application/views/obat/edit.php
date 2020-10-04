<!-- Container Fluid-->
<div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><?=$title?></h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?=base_url()?>obat">Menu</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit</li>
        </ol>
    </div>
    <style>
        /* th { font-size: 12px; }
        td { font-size: 11px; } */
        .dataTables_wrapper {
            font-family: tahoma;
            font-size: 12px;
            
        }
    </style>
    <form action="<?=base_url()?>obat/update" method="POST">
    <div class="row mb-3">
        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-6 col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Kode Menu:</label>
                        <input type="hidden" name="id_obat" value="<?=$obat->row()->id_obat?>">
                        <input type="text" class="form-control" name="kode_obat" value="<?=$obat->row()->kode_obat?>" required>
                    </div>
                    <div class="form-group">
                        <label for="">Nama Menu:</label>
                        <input type="text" class="form-control" name="nama_obat" value="<?=$obat->row()->nama_obat?>" required>
                    </div>
                    <div class="form-group">
                        <label for="">Kategori:</label>
                        <select class="form-control" name="kategori" required>
                            <option value="">--pilih--</option>
                            <?php foreach($kategori->result() as $r_kat){ ?>
                            <option value="<?=$r_kat->id_unit?>" <?=$obat->row()->id_unit == $r_kat->id_unit ? 'selected' : ''?>><?=$r_kat->nama_unit?></option>
                            <?php }?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Harga:</label>
                        <input type="number" class="form-control" name="harga" value="<?=$obat->row()->harga?>" required>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Simpan</button>
                </div>
            </div>
        </div>
        
    </div>
    </form>

</div>
<!---Container Fluid-->