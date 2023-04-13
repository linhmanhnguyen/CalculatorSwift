//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyễn Mạnh Linh on 03/04/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblHienThiKetQua: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var soThuNhatDangChuoi = ""
    var soThuNhatDangSo = 0
    var soThuHaiDangChuoi = ""
    var soThuHaiDangSo = 0
    var dangOTrangThaiSo2 = false
    var phepTinh = ""
    var ketQua = 0
    
    @IBAction func btnCalculator(_ sender: UIButton) {
        
        lblHienThiKetQua.text! += sender.titleLabel!.text!
        
        if (sender.titleLabel?.text! == "C"){
            lblHienThiKetQua.text! = ""
        }

        if sender.titleLabel?.text! == "+" {
            phepTinh = "+"
        }
        if sender.titleLabel?.text! == "-"{
            phepTinh = "-"
        }
        if sender.titleLabel?.text! == "*"{
            phepTinh = "*"
        }
        if sender.titleLabel?.text! == "/"{
            phepTinh = "/"
        }
        
        if sender.titleLabel?.text! == "+" || sender.titleLabel?.text! == "-" || sender.titleLabel?.text! == "*" || sender.titleLabel?.text! == "/" {
                        if dangOTrangThaiSo2{
                            lblHienThiKetQua.text! += sender.titleLabel!.text!
                        }else {
                            soThuNhatDangChuoi += lblHienThiKetQua.text!
                            // gán giá trị nhập từ bàn phím vào chuỗi soThuNhatDangChuoi
                            soThuNhatDangChuoi.remove(at: soThuNhatDangChuoi.index(before: soThuNhatDangChuoi.endIndex))
                            // cắt phần tử cuối cùng: tức là cắt dấu phép tính mình vừa nhập
                            lblHienThiKetQua.text! = ""
                            // reset lại chuỗi mình vừa nhập về giá trị rỗng
                            soThuNhatDangSo = Int(soThuNhatDangChuoi) ?? 0
                            // chuyển đổi kiểu dạng String sang Int
                            dangOTrangThaiSo2 = true
                        }
        }
           
        
        if sender.titleLabel?.text! == "="{
            soThuHaiDangChuoi += lblHienThiKetQua.text!
            soThuHaiDangChuoi.remove(at: soThuHaiDangChuoi.index(before: soThuHaiDangChuoi.endIndex))
            soThuHaiDangSo = Int(soThuHaiDangChuoi) ?? 0
            print("so thu hai la: \(soThuHaiDangSo)")
            tinh(phepTinh: phepTinh)
            soThuNhatDangChuoi = ""
            soThuHaiDangChuoi = ""
        }
        
    }
    func tinh(phepTinh: String){
        if phepTinh == "+" {
            ketQua = soThuNhatDangSo + soThuHaiDangSo
            lblHienThiKetQua.text! = "\(ketQua)"
        }
        if phepTinh == "-"{
            ketQua = soThuNhatDangSo - soThuHaiDangSo
            lblHienThiKetQua.text! = "\(ketQua)"
        }
        if phepTinh == "*"{
            ketQua = soThuNhatDangSo*soThuHaiDangSo
            lblHienThiKetQua.text! = "\(ketQua)"
        }
        if phepTinh == "/"{
            if (soThuHaiDangSo == 0){
                lblHienThiKetQua.text! = "Lỗi"
            }else{
                ketQua = soThuNhatDangSo/soThuHaiDangSo
                lblHienThiKetQua.text! = "\(ketQua)"
            }
        }
        soThuNhatDangSo = ketQua
        dangOTrangThaiSo2 = false
    }
}

