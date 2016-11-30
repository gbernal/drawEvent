#pragma once

#include "ofxiOS.h"

class ofApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void mouseDragged(int x, int y, int button);

	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        ofPolyline line;
        ofPoint pt;
        string s;
        ofPoint pts[5];
        uint ctr;
        ofPath path;
        ofPolyline lineOrig;



};


