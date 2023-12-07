//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyễn Mạnh Linh on 03/04/2023.
//

import UIKit

extension UIButton {
    func applyCornerRadius() {
        layer.cornerRadius = 30
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var lblHienThiKetQua: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyCornerRadiusToButtonsInView(view)
        lblHienThiKetQua.textColor = .white
        lblHienThiKetQua.font = UIFont.boldSystemFont(ofSize: 60)
    }
    
    var soThuNhatDangChuoi = ""
    var soThuNhatDangSo = 0.0
    var soThuHaiDangChuoi = ""
    var soThuHaiDangSo = 0.0
    var dangOTrangThaiSo2 = false
    var phepTinh = ""
    var ketQua: Double = 0
    
    @IBAction func btnCalculator(_ sender: UIButton) {
        
        lblHienThiKetQua.text! += sender.titleLabel!.text!
        
        if (sender.titleLabel?.text! == "C"){
            lblHienThiKetQua.text! = ""
        }
        
        if sender.titleLabel?.text! == "+/-" {
            // Toggle the sign of the current operand
            if dangOTrangThaiSo2 {
                if lblHienThiKetQua.text!.hasPrefix("-") {
                    lblHienThiKetQua.text!.removeFirst()
                } else {
                    lblHienThiKetQua.text! = "-" + lblHienThiKetQua.text!
                }
            } else {
                soThuNhatDangSo *= -1
                lblHienThiKetQua.text! = "-" //"\(soThuNhatDangSo)"
            }
        } else {
            // Existing code for other buttons
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
                            soThuNhatDangChuoi.remove(at: soThuNhatDangChuoi.index(before: soThuNhatDangChuoi.endIndex))
                            lblHienThiKetQua.text! = ""
                            soThuNhatDangSo = Double(soThuNhatDangChuoi) ?? 0
                            dangOTrangThaiSo2 = true
                        }
        }
           
        
        if sender.titleLabel?.text! == "="{
            soThuHaiDangChuoi += lblHienThiKetQua.text!
            soThuHaiDangChuoi.remove(at: soThuHaiDangChuoi.index(before: soThuHaiDangChuoi.endIndex))
            soThuHaiDangSo = Double(soThuHaiDangChuoi) ?? 0
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
    func applyCornerRadiusToButtonsInView(_ view: UIView) {
        for subview in view.subviews {
            if let button = subview as? UIButton {
                button.applyCornerRadius()
            } else {
                applyCornerRadiusToButtonsInView(subview)
            }
        }
    }

}

