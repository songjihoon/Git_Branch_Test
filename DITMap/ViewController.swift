//
//  ViewController.swift
//  DITMap
//
//  Created by 김종현 on 2017. 8. 31..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  지도의 center 위치, DIT 위치정보 35.166197, 129.072594
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        myMapView.setRegion(region, animated: true)
        
        // Annotation(Pin) 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        
        // 부산시민공원 35.168444, 129.057832
        let anno02 = MKPointAnnotation()
        anno02.coordinate.latitude = 35.168444
        anno02.coordinate.longitude = 129.057832
        anno02.title = "부산시민공원"
        anno02.subtitle = "부산시민들의 휴식처"
        
        //황령산봉수대 35.1569625, 129.0726307
        let anno03 = MKPointAnnotation()
        anno03.coordinate.latitude = 35.1569625
        anno03.coordinate.longitude = 129.0726307
        anno03.title = "황령산봉수대"
        anno03.subtitle = "야경"
        
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        myMapView.addAnnotation(anno03)
        
        myMapView.delegate = self
    }
    
    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        var  annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
            }
            
            
        } else {
            annotationView?.annotation = annotation
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named:"bright-7.png" )
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn
        
        return annotationView
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if(view.tag==0){
            print(view.tag)
            view.tintColor=UIColor.orange
        }
        if control==view.rightCalloutAccessoryView{
            self.performSegue(withIdentifier: "goDetail", sender: self)
        }
    }
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        print("callout Accessory Tapped")
//        
//        let viewAnno = view.annotation
//        let viewTitle: String = ((viewAnno?.title)!)!
//        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
//        
//        print("\(viewTitle)\(viewSubTitle)")
//        
//        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil   ))
//        present(ac, animated: true, completion: nil)
//    }
    }

    
    
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        
//        print("callout Accessory Tapped!")
//        
//        let viewAnno = view.annotation
//        let viewTitle: String = ((viewAnno?.title)!)!
//        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
//        
//        print("\(viewTitle) \(viewSubTitle)")
//        
//        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .actionSheet)
//        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        ac.addAction(UIAlertAction(title: "DELETE", style: .destructive, handler: nil))
//        present(ac, animated: true, completion: nil)




