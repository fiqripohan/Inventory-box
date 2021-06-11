<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pengaturan extends CI_Controller
{

	public $parent_modul = 'Pengaturan';
	public $title = 'Pengaturan';

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('LoggedIN') == FALSE) redirect('auth/logout');
		$this->akses_controller = $this->uri->segment(3);
	}

	public function daftarModul()
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$data['title'] = $this->title;
		$data['subtitle'] = 'Daftar Modul';
		$data['content'] = 'panel/pengaturan/modulMenu/index';
		$data['parentModul'] = $this->GeneralModel->get_general_order_by('e_parent_modul', 'urutan', 'ASC');
		$this->load->view('panel/content', $data);
	}
}
