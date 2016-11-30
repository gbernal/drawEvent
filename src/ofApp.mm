#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
    ofBackground(0,0,0);
    // touch events will be sent to this object (this instance of testApp)
    

}

//--------------------------------------------------------------
void ofApp::update(){
    
    for (auto &vert : line.getVertices()){
        vert.x += ofRandom(-1,1);
        vert.y += ofRandom(-1,1);
    }
    

}

//--------------------------------------------------------------
void ofApp::draw(){
    line.draw();
    ofDrawCircle(pt, 10);
    ofDrawBitmapString(s, pt);
    
    path.setFilled(false);
    if (path.getOutline().size() > 0){
        path.getOutline()[0].draw();
    }
    
    
    lineOrig.draw();

	
}

//--------------------------------------------------------------
void ofApp::exit(){

}



//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    pt.x = touch.x;
    pt.y = touch.y;
    
    s="TouchID : ";
    s.append(ofToString(touch.id ));
    
    
    ctr = 0;
    pts[0] = ofPoint(pt.x,pt.y);
    path.clear();
    
    lineOrig.addVertex( ofPoint (pt.x,pt.y));



}



//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

    line.addVertex(pt);
    ofPoint p = ofPoint(pt.x,pt.y);
    ctr++;
    pts[ctr] = p;
    if (ctr == 4)
    {
        pts[3] = ofPoint((pts[2].x + pts[4].x)/2.0, (pts[2].y + pts[4].y)/2.0); // move the endpoint to the middle of the line joining the second control point of the first Bezier segment and the first control point of the second Bezier segment
        
        if (path.getCommands().size() == 0) path.moveTo(pts[0]);
        path.bezierTo(pts[1],pts[2], pts[3]);
        
        pts[0] = pts[3];
        pts[1] = pts[4];
        ctr = 1;
    }

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

