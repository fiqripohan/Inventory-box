<?php

use function PHPSTORM_META\map;

defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . 'third_party/phpqrcode/qrlib.php';

class Inventori extends CI_Controller
{

	public $parent_modul = 'Inventori';
	public $title = 'Inventori';

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('LoggedIN') == FALSE) redirect('auth/logout');
		$this->akses_controller = $this->uri->segment(3);
	}


	//------------------------ KATEGORI BEGIN ------------------------//
	public function kategori(){
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
			$data['title'] = $this->title;
			$data['subtitle'] = 'Daftar Kategori Inventori';
			$data['content'] = 'panel/inventori/kategori/index';
			$data['getKategoriInventori'] = $this->GeneralModel->get_general('e_kategori_inventori');
			$this->load->view('panel/content', $data);
	}

	public function createKategori($param1=''){
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1=='doCreate') {
			$dataKategori = array(
				'nama_kategori' => $this->input->post('nama_kategori'),
				'created_by' => $this->session->userdata('id_pengguna')
			);
			if ($this->GeneralModel->create_general('e_kategori_inventori', $dataKategori) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Data kategori inventori berhasil ditambahkan</div>');
				redirect(changeLink('panel/inventori/kategori'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data kategori inventori gagal ditambahkan</div>');
				redirect(changeLink('panel/inventori/kategori'));
			}
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'Tambah Kategori Inventori';
			$data['content'] = 'panel/inventori/kategori/create';
			$this->load->view('panel/content', $data);
		}
	}

	public function updateKategori($param1 = '', $param2 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$dataKategori = array(
				'nama_kategori' => $this->input->post('nama_kategori'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE('Y-m-d H:i:s')
			);
			if ($this->GeneralModel->update_general('e_kategori_inventori','id_kategori',$param2,$dataKategori) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Data kategori inventori berhasil diupdate</div>');
				redirect(changeLink('panel/inventori/kategori'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data kategori inventori gagal diupdate</div>');
				redirect(changeLink('panel/inventori/kategori'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Kategori Inventori';
			$data['content'] = 'panel/inventori/kategori/update';
			$data['kategori'] = $this->GeneralModel->get_by_id_general('e_kategori_inventori','id_kategori',$param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteKategori($param1=''){
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($this->GeneralModel->delete_general('e_kategori_inventori', 'id_kategori', $param1) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Data kategori inventori berhasil dihapus</div>');
			redirect(changeLink('panel/inventori/kategori'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data kategori inventori gagal dihapus</div>');
			redirect(changeLink('panel/inventori/kategori'));
		}
	}

	//------------------------ SATUAN BEGIN ------------------------//
	public function satuan()
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$data['title'] = $this->title;
		$data['subtitle'] = 'Daftar Satuan Inventori';
		$data['content'] = 'panel/inventori/satuan/index';
		$data['getSatuanInventori'] = $this->GeneralModel->get_general('e_satuan_inventori');
		$this->load->view('panel/content', $data);
	}

	public function createSatuan($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doCreate') {
			$dataSatuan = array(
				'nama_satuan' => $this->input->post('nama_satuan'),
				'singkatan_satuan' => $this->input->post('singkatan_satuan'),
				'created_by' => $this->session->userdata('id_pengguna')
			);
			if ($this->GeneralModel->create_general('e_satuan_inventori', $dataSatuan) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Data satuan inventori berhasil ditambahkan</div>');
				redirect(changeLink('panel/inventori/satuan'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data satuan inventori gagal ditambahkan</div>');
				redirect(changeLink('panel/inventori/satuan'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Tambah Satuan Inventori';
			$data['content'] = 'panel/inventori/satuan/create';
			$this->load->view('panel/content', $data);
		}
	}

	public function updateSatuan($param1 = '', $param2 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$dataSatuan = array(
				'nama_satuan' => $this->input->post('nama_satuan'),
				'singkatan_satuan' => $this->input->post('singkatan_satuan'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE('Y-m-d H:i:s')
			);
			if ($this->GeneralModel->update_general('e_satuan_inventori', 'id_satuan', $param2, $dataSatuan) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Data satuan inventori berhasil diupdate</div>');
				redirect(changeLink('panel/inventori/satuan'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data satuan inventori gagal diupdate</div>');
				redirect(changeLink('panel/inventori/satuan'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Satuan Inventori';
			$data['content'] = 'panel/inventori/satuan/update';
			$data['satuan'] = $this->GeneralModel->get_by_id_general('e_satuan_inventori', 'id_satuan', $param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteSatuan($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($this->GeneralModel->delete_general('e_satuan_inventori', 'id_satuan', $param1) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Data satuan inventori berhasil dihapus</div>');
			redirect(changeLink('panel/inventori/satuan'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Data satuan inventori gagal dihapus</div>');
			redirect(changeLink('panel/inventori/satuan'));
		}
	}

}