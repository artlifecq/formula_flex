package away3d.ribbon
{
    import flash.geom.Vector3D;
    import away3d.containers.ObjectContainer3D;
    import __AS3__.vec.Vector;
    import away3d.primitives.PlaneGeometry;
    import away3d.core.base.Geometry;
    import away3d.materials.TextureMaterial;
    import away3d.materials.MaterialBase;
    import away3d.core.base.CompactSubGeometry;
    import away3d.core.base.Object3D;

    public class LightningRibbon extends RibbonBase 
    {

        private static const DirVector:Vector3D = new Vector3D(0, 1, 0);

        private static var tmpVec:Vector3D = new Vector3D();

        protected var _target1:ObjectContainer3D;
        protected var _target2:ObjectContainer3D;
        private var _positions1:Vector.<Vector3D>;
        private var _positions2:Vector.<Vector3D>;
        private var _right:Vector3D;
        private var _look:Vector3D;
        private var _boundPoints:Vector.<Number>;
        private var _shakeAmp:Number = 100;
        private var _lastShakeTime:int = -1;
        private var _shakeTimer:int = 100;

        public function LightningRibbon(object1:ObjectContainer3D, object2:ObjectContainer3D, segmentCount:int, height:Number, material:MaterialBase=null)
        {
            var i:int;
            _right = new Vector3D();
            _look = new Vector3D();
            var geometry:Geometry = new PlaneGeometry(0, height, segmentCount, 1, false);
            geometry.isDynmaic = true;
            super(segmentCount, geometry, material);
            (material as TextureMaterial).animateUVs = true;
            _positions1 = new Vector.<Vector3D>((segmentCount + 1));
            _positions2 = new Vector.<Vector3D>((segmentCount + 1));
            _halfHeight = (height / 2);
            i = 0;
            while (i < (segmentCount + 1))
            {
                _positions1[i] = new Vector3D();
                _positions2[i] = new Vector3D();
                i++;
            };
            _target1 = object1;
            _target2 = object2;
            _boundPoints = new Vector.<Number>(6, true);
        }

        public function get target2():ObjectContainer3D
        {
            return (_target2);
        }

        public function set target2(value:ObjectContainer3D):void
        {
            _target2 = value;
        }

        public function get target1():ObjectContainer3D
        {
            return (_target1);
        }

        public function set target1(value:ObjectContainer3D):void
        {
            _target1 = value;
        }

        public function get shakeTimer():int
        {
            return (_shakeTimer);
        }

        public function set shakeTimer(value:int):void
        {
            _shakeTimer = value;
        }

        public function setBindPoints(object1:ObjectContainer3D, object2:ObjectContainer3D):void
        {
            _target1 = object1;
            _target2 = object2;
        }

        public function get shakeAmp():Number
        {
            return (_shakeAmp);
        }

        public function set shakeAmp(value:Number):void
        {
            _shakeAmp = value;
        }

        override public function set ribbonHeight(value:Number):void
        {
            if ((value == (_halfHeight * 2)))
            {
                return;
            };
            if (_geometry)
            {
                _geometry.dispose();
            };
            geometry = validateRibbonProperty(_segmentCount, value);
        }

        public function get segmentCount():int
        {
            return (_segmentCount);
        }

        public function set segmentCount(value:int):void
        {
            if ((_segmentCount == value))
            {
                return;
            };
            if (_geometry)
            {
                _geometry.dispose();
            };
            geometry = validateRibbonProperty(_segmentCount, value);
        }

        protected function validateRibbonProperty(seg:int, height:Number):Geometry
        {
            var i:int;
            _segmentCount = seg;
            var geometry:Geometry = new PlaneGeometry(0, height, seg, 1, false);
            geometry.isDynmaic = true;
            _positions1 = new Vector.<Vector3D>((seg + 1));
            _positions2 = new Vector.<Vector3D>((seg + 1));
            _halfHeight = (height / 2);
            i = 0;
            while (i < (seg + 1))
            {
                _positions1[i] = new Vector3D();
                _positions2[i] = new Vector3D();
                i++;
            };
            return (geometry);
        }

        override public function start():void
        {
            var i:int;
            var pos:Vector3D = ((_target1) ? (_target1.scenePosition) : scenePosition);
            i = 0;
            while (i < (_segmentCount + 1))
            {
                _positions1[i].copyFrom(pos);
                _positions2[i].copyFrom(pos);
                i++;
            };
            super.start();
        }

        override protected function updateBounds():void
        {
            var pos = null;
            super.updateBounds();
            var i:int;
            pos = _positions1[0];
            _boundPoints[i++] = pos.x;
            _boundPoints[i++] = pos.y;
            _boundPoints[i++] = pos.z;
            pos = _positions2[_segmentCount];
            _boundPoints[i++] = pos.x;
            _boundPoints[i++] = pos.y;
            _boundPoints[i] = pos.z;
            _bounds.fromVertices(_boundPoints);
            _boundsInvalid = false;
        }

        override protected function ribbonInternalUpdate(deltaTime:int):void
        {
            var pos1 = null;
            var pos2 = null;
            var lightingDir = null;
            var distance:Number;
            var shakeDir = null;
            var up = null;
            var data = null;
            var stride:int;
            var i:int;
            var pos = null;
            var index0:int;
            var index1:int;
            var isShake:Boolean;
            if ((((_lastShakeTime < 0)) || ((_lastShakeTime > _shakeTimer))))
            {
                isShake = true;
            };
            if ((_lastShakeTime > _shakeTimer))
            {
                _lastShakeTime = (_lastShakeTime % _shakeTimer);
                isShake = true;
            };
            _lastShakeTime = (_lastShakeTime + deltaTime);
            if (((((isShake) && (_target1))) && (_target2)))
            {
                pos1 = ((_target1) ? (_target1.scenePosition) : scenePosition);
                pos2 = ((_target2) ? (_target2.scenePosition) : scenePosition);
                lightingDir = pos2.subtract(pos1);
                distance = lightingDir.length;
                lightingDir.normalize();
                shakeDir = lightingDir.crossProduct(DirVector);
                shakeDir.normalize();
                _right.copyFrom(pos2);
                _right.decrementBy(pos1);
                _look.copyFrom(pos2);
                if (scene)
                {
                    _look.decrementBy(scene.view.camera.scenePosition);
                };
                up = _look.crossProduct(_right);
                up.normalize();
                data = this.geometry.subGeometries[0].vertexData;
                stride = this.geometry.subGeometries[0].vertexStride;
                i = 0;
                while (i < (_segmentCount + 1))
                {
                    pos = _positions1[i];
                    pos.copyFrom(pos1);
                    tmpVec.copyFrom(lightingDir);
                    tmpVec.scaleBy(((i / _segmentCount) * distance));
                    pos.incrementBy(tmpVec);
                    if (((!((i == 0))) && (!((i == _segmentCount)))))
                    {
                        tmpVec.copyFrom(shakeDir);
                        tmpVec.scaleBy((shakeAmp * (Math.random() - 0.5)));
                        pos.incrementBy(tmpVec);
                    };
                    tmpVec.copyFrom(up);
                    tmpVec.scaleBy(_halfHeight);
                    pos.incrementBy(tmpVec);
                    pos = _positions2[i];
                    pos.copyFrom(_positions1[i]);
                    tmpVec.scaleBy(-2);
                    pos.incrementBy(tmpVec);
                    i++;
                };
                i = 0;
                while (i < (_segmentCount + 1))
                {
                    index0 = (i * stride);
                    index1 = ((i * stride) + ((_segmentCount + 1) * stride));
                    pos1 = _positions1[i];
                    pos2 = _positions2[i];
                    data.position = (index0 << 2);
                    data.writeFloat(pos1.x);
                    data.writeFloat(pos1.y);
                    data.writeFloat(pos1.z);
                    data.position = (index1 << 2);
                    data.writeFloat(pos2.x);
                    data.writeFloat(pos2.y);
                    data.writeFloat(pos2.z);
                    i++;
                };
                CompactSubGeometry(geometry.subGeometries[0]).updateData(data);
            };
        }

        override public function clone():Object3D
        {
            var clone:LightningRibbon = new LightningRibbon(_target1, _target2, segmentCount, ribbonHeight, material);
            clone.shakeAmp = shakeAmp;
            clone.shakeTimer = shakeTimer;
            clone.transform = transform;
            clone.pivotPoint = pivotPoint;
            clone.partition = partition;
            if (_bounds)
            {
                clone.bounds = _bounds.clone();
            };
            clone.name = name;
            clone.castsShadows = castsShadows;
            clone.shareAnimationGeometry = shareAnimationGeometry;
            clone.mouseEnabled = this.mouseEnabled;
            clone.mouseChildren = this.mouseChildren;
            clone.overwriteBounds = this.overwriteBounds;
            clone.userMin = this.userMin.clone();
            clone.userMax = this.userMax.clone();
            clone.gpuBoundsMax = this.gpuBoundsMax.clone();
            clone.gpuBoundsMin = this.gpuBoundsMin.clone();
            clone.autoGpuBounds = this.autoGpuBounds;
            clone.layerType = this.layerType;
            clone.displayLevel = this.displayLevel;
            clone.zOffset = this.zOffset;
            clone.extra = this.extra;
            if (animator)
            {
                clone.animator = animator.clone();
            };
            return (clone);
        }


    }
}//package away3d.ribbon
