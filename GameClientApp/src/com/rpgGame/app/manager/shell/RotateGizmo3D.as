package com.rpgGame.app.manager.shell
{
    import com.game.engine2D.Scene;
    import com.game.engine3D.manager.Stage3DLayerManager;
    
    import flash.display.BlendMode;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    
    import away3d.containers.ObjectContainer3D;
    import away3d.core.base.Object3D;
    import away3d.core.pick.AS3PickingCollider;
    import away3d.core.pick.IPickingCollider;
    import away3d.entities.Mesh;
    import away3d.entities.SegmentSet;
    import away3d.events.Event;
    import away3d.events.MouseEvent3D;
    import away3d.lights.DirectionalLight;
    import away3d.materials.ColorMaterial;
    import away3d.materials.lightpickers.StaticLightPicker;
    import away3d.primitives.LineSegment;
    import away3d.primitives.SphereGeometry;
    import away3d.primitives.TorusGeometry;

    public class RotateGizmo3D extends ObjectContainer3D {
        private static var _instance : RotateGizmo3D;
        
        private var _content : ObjectContainer3D;
        
        private var _sphereMaterial : ColorMaterial;
        private var _xTorusMaterial : ColorMaterial;
        private var _yTorusMaterial : ColorMaterial;
        private var _zTorusMaterial : ColorMaterial;
        private var _hightOverMaterial : ColorMaterial;
        private var _hightDownMaterial : ColorMaterial;
        
        private var _xTorus : Mesh;
        private var _yTorus : Mesh;
        private var _zTorus : Mesh;
        private var _sphere : Mesh;
        
        private var _lines : SegmentSet;
        private var _xLine : LineSegment;
        private var _yLine : LineSegment;
        private var _zLine : LineSegment;
        
        private var _freeXAxis : Vector3D = new Vector3D();
        private var _freeYAxis : Vector3D = new Vector3D();
        private var _freeZAxis : Vector3D = new Vector3D();
        
        private var _isActive : Boolean = false;
        private var _isMove : Boolean = false;
        private var _curAxis : String = null;
        private var _behindGizmoPlane : Boolean = false;
        
        private var _deltaValue : Vector3D = new Vector3D();
        private var _click : Point = new Point();
        private var _click2 : Point = new Point();
        
        private var _acutalContent : Object3D = new Object3D();
        private var _axisRotation : Vector3D = new Vector3D();
        private var _originDirection : Vector3D = null;
        
        public static function instance() : RotateGizmo3D {
            if (null == _instance) {
                _instance = new RotateGizmo3D();
                Stage3DLayerManager.screenView.scene.addChild(_instance);
            }
            return _instance;
        }
        
        public function RotateGizmo3D() {
            var light : DirectionalLight = new DirectionalLight(1, 1, 1);
            light.name = "RotateGizmo3DLight";
            light.color = 0xFFFFFF;
            light.ambient = 0.3;
            light.diffuse = 1;
            light.specular = 0.1;
            var lightPicker : StaticLightPicker = new StaticLightPicker([light]);
            
            this._content = new ObjectContainer3D();
            this.addChild(this._content);
            
            this._sphereMaterial = new ColorMaterial(0xFFFFFF, 0.3);
            this._sphereMaterial.blendMode = BlendMode.LAYER;
            this._sphereMaterial.lightPicker = lightPicker;
            this._sphere = new Mesh(new SphereGeometry(95), this._sphereMaterial);
            this._sphere.name = "allAxis";
            this.addChild(this._sphere);
            
            var pickingCollider : IPickingCollider = new AS3PickingCollider(true);
            var torusGeometry : TorusGeometry = new TorusGeometry(100, 5, 30, 8, false);
            
            this._xTorusMaterial = new ColorMaterial(0xFF0000, 1);
            this._xTorusMaterial.lightPicker = lightPicker;
            this._xTorus = new Mesh(torusGeometry, this._xTorusMaterial);
            this._xTorus.name = "xAxis";
            this._xTorus.mouseEnabled = true;
            this._xTorus.pickingCollider = pickingCollider;
            this._xTorus.rotationY = 90;
            this._xTorus.addEventListener(MouseEvent3D.MOUSE_OVER, onMouseOver);
            this._xTorus.addEventListener(MouseEvent3D.MOUSE_OUT, onMouseOut);
            this._xTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown);
            this._content.addChild(this._xTorus);
            
            this._yTorusMaterial = new ColorMaterial(0x00CC00, 1);
            this._yTorusMaterial.lightPicker = lightPicker;
            this._yTorus = new Mesh(torusGeometry, this._yTorusMaterial);
            this._yTorus.name = "yAxis";
            this._yTorus.mouseEnabled = true;
            this._yTorus.pickingCollider = pickingCollider;
            this._yTorus.rotationX = -90;
            this._yTorus.addEventListener(MouseEvent3D.MOUSE_OVER, onMouseOver);
            this._yTorus.addEventListener(MouseEvent3D.MOUSE_OUT, onMouseOut);
            this._yTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown);
            this._content.addChild(this._yTorus);
            
            this._zTorusMaterial = new ColorMaterial(0x0033FF, 1);
            this._zTorusMaterial.lightPicker = lightPicker;
            this._zTorus = new Mesh(torusGeometry, this._zTorusMaterial);
            this._zTorus.name = "zAxis";
            this._zTorus.mouseEnabled = true;
            this._zTorus.pickingCollider = pickingCollider;
            this._zTorus.addEventListener(MouseEvent3D.MOUSE_OVER, onMouseOver);
            this._zTorus.addEventListener(MouseEvent3D.MOUSE_OUT, onMouseOut);
            this._zTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown);
            this._content.addChild(this._zTorus);
            
            this._lines = new SegmentSet();
            this._zLine = new LineSegment(new Vector3D(), new Vector3D(), 0xFFCC00, 0xFFCC00, 3);
            this._lines.addSegment(this._zLine);
            this._xLine = new LineSegment(new Vector3D(), new Vector3D(), 0xFF0000, 0xFF0000, 3);
            this._lines.addSegment(this._xLine);
            this._yLine = new LineSegment(new Vector3D(), new Vector3D(), 0xCC99CC, 0xCC99CC, 3);
            this._lines.addSegment(this._yLine);
            this.addChild(this._lines);
            
            this._hightOverMaterial = new ColorMaterial(0xFFCC00);
            this._hightOverMaterial.lightPicker = lightPicker;
            
            this._hightDownMaterial = new ColorMaterial(0xFFF000);
            this._hightDownMaterial.lightPicker = lightPicker;
        }
        
        public function show(sceneObject : ObjectContainer3D) : void {
            this.visible = true;
            this._content.transform.identity();
            this.update();
            this.position = new Vector3D(100, 500);
            this._xTorus.rotationX = 0;
            this._xTorus.rotationZ = 0;
            this._xTorus.rotationY = 90;
            
            this._zTorus.visible = false;
            
            this._acutalContent.rotationX = this._acutalContent.rotationY = this._acutalContent.rotationZ = 0;
            this._originDirection = Scene.scene.directionalLight.direction.clone();
            
            Stage3DLayerManager.screenView.mouseChildren = true;
            Stage3DLayerManager.screenView.mouseEnabled = true;
            
            Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, this.loop);
        }
        
        public function hide() : void {
            this.visible = false;
            this._isActive = false;
            this._isMove = false;
            Stage3DLayerManager.screenView.mouseChildren = false;
            Stage3DLayerManager.screenView.mouseEnabled = false;
            Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, this.loop);
        }
        
        private function loop(e : Event) : void {
            this.update();
        }
        
        private function update() : void {
            if (!this._isActive) {
                this._xTorus.rotationX = Scene.scene.directionalLight.rotationX + 90;
                this._xTorus.rotationY = Scene.scene.directionalLight.rotationY;
                this._xTorus.rotationZ = Scene.scene.directionalLight.rotationZ;
            }
            this._xLine.end = this._freeXAxis;
            this._yLine.end = this._freeYAxis;
            this._zLine.end = this._freeZAxis;
        }
        
        private function onMouseOver(e : MouseEvent3D) : void {
            if (!this._isActive) {
                return;
            }
            if ("xAxis" == e.target["name"]) {
                this._xTorus.material = this._xTorusMaterial;
            } else if ("yAxis" == e.target["name"]) {
                this._yTorus.material = this._yTorusMaterial;
            } else if ("zAxis" == e.target["name"]) {
                this._zTorus.material = this._zTorusMaterial;
            }
        }
        
        private function onMouseOut(e : MouseEvent3D) : void {
            if (!this._isActive) {
                return;
            }
            if ("xAxis" == e.target["name"]) {
                this._xTorus.material = this._hightOverMaterial;
            } else if ("yAxis" == e.target["name"]) {
                this._yTorus.material = this._hightOverMaterial;
            } else if ("zAxis" == e.target["name"]) {
                this._zTorus.material = this._hightOverMaterial;
            }
        }
        
        private function onMouseDown(e : MouseEvent3D) : void {
            this._isActive = true;
            this._isMove = true;
            this._curAxis = e.target["name"];
            this._behindGizmoPlane = this.scenePosition.subtract(e.scenePosition).z > 0;
            
            this._click.x = Stage3DLayerManager.stage.mouseX;
            this._click.y = Stage3DLayerManager.stage.mouseY;
            this._click2.x = Stage3DLayerManager.stage.mouseX;
            this._click2.y = Stage3DLayerManager.stage.mouseY;
            
            Stage3DLayerManager.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            Stage3DLayerManager.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            if ("xAxis" == this._curAxis) {
                this._xTorus.material = this._hightOverMaterial;
                this._axisRotation.copyFrom(this._content.rightVector);
                this._axisRotation.copyFrom(this._xTorus.rightVector);
            } else if ("yAxis" == this._curAxis) {
                this._yTorus.material = this._hightOverMaterial;
                this._axisRotation.copyFrom(this._content.upVector);
            } else if ("zAxis" == this._curAxis) {
                this._zTorus.material = this._hightOverMaterial;
                this._axisRotation.copyFrom(this._content.forwardVector);
            }
        }
        
        private function onMouseUp(e : MouseEvent) : void {
            this._isActive = false;
            this._isMove = false;
            this._curAxis = null;
            
            Stage3DLayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            Stage3DLayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            
            this._xTorus.material = this._xTorusMaterial;
            this._yTorus.material = this._yTorusMaterial;
            this._zTorus.material = this._zTorusMaterial;
            this._sphere.material = this._sphereMaterial;
            this._sphere.eulers = new Vector3D();
            
            this._deltaValue.x = this._deltaValue.y = this._deltaValue.z = 0;
            
            if ("xAxis" == this._curAxis) {
            } else if ("yAxis" == this._curAxis) {
            } else if ("zAxis" == this._curAxis) {
            }
        }
        
        private function onMouseMove(e : MouseEvent) : void {
            var dx : Number = Stage3DLayerManager.stage.mouseX - this._click.x;
            var dy : Number = Stage3DLayerManager.stage.mouseY - this._click.y;
            var rx : Number = Stage3DLayerManager.stage.mouseX - this._click2.x;
            var ry : Number = Stage3DLayerManager.stage.mouseY - this._click2.y;
            var trans : Number = (dx + dy) / 2 * (this._behindGizmoPlane ? 1 : -1);
            var v1 : Vector3D;
            var v2 : Vector3D;
            var vx : Number;
            if ("xAxis" == this._curAxis) {
                v1 = Scene.scene.gameScene3d.camera.rightVector;
                v2 = this._content.rightVector;
            } else if ("yAxis" == this._curAxis) {
                v1 = Scene.scene.gameScene3d.camera.downVector;
                v2 = this._content.downVector;
            } else if ("zAxis" == this._curAxis) {
                v1 = Scene.scene.gameScene3d.camera.forwardVector;
                v2 = this._content.forwardVector;
            }
            v1.normalize();
            v2.normalize();
            vx = v1.dotProduct(v2);
            if (vx < 0) {
                trans = -trans;
            }
            this._acutalContent.rotate(this._axisRotation, trans);
            this.updateDirectionalLight();
        }
        
        private function updateDirectionalLight() : void {
            var dir : Vector3D = new Vector3D();
            dir = this._acutalContent.transform.transformVector(this._originDirection);
            Scene.scene.directionalLight.direction = dir;
            this._xTorus.rotationX = Scene.scene.directionalLight.rotationX + 90;
            this._xTorus.rotationY = Scene.scene.directionalLight.rotationY;
            this._xTorus.rotationZ = Scene.scene.directionalLight.rotationZ;
        }
    }
}